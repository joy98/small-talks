//
//  632.swift
//  Small Talks
//
//  Created by Joy Sarkar on 02/10/24.
//

import Foundation
import HeapModule

class Solution632 {

    struct Val: Comparable {
        var val: Int
        var i: Int
        var j: Int

        static func < (lhs: Val, rhs: Val) -> Bool {
            lhs.val < rhs.val
        }

        static func > (lhs: Val, rhs: Val) -> Bool {
            lhs.val > rhs.val
        }
    }

    func smallestRange(_ nums: [[Int]]) -> [Int] {
        
        let n = nums.count
        var heap = Heap<Val>()
        var minV = Int.max, maxV = Int.min

        for i in 0..<n {
            print(i)
            heap.insert(Val(val: nums[i][0], i: i, j: 0))
            minV = min(minV,nums[i][0])
            maxV = max(maxV,nums[i][0])
        }
        var r = maxV-minV
        var res = [minV,maxV]

        while(heap.count == n) {
            let least = heap.removeMin()

            if (least.j + 1) < nums[least.i].count {
                let nextVal = Val(val: nums[least.i][least.j+1], i : least.i, j: least.j+1)
                maxV = max(maxV,nextVal.val)

                heap.insert(nextVal)
                minV = heap.min!.val

                if (maxV-minV) < r {
                    r = maxV - minV
                    res = [minV,maxV]
                }
            }
        }
        return res
    }
}
