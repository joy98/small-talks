//
//  46.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

class Solution46 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var nums = nums
        backTrack(&result, &nums, 0)
        return result
    }

    func backTrack(_ result: inout [[Int]], _ input: inout [Int], _ startIdx: Int) {
        if startIdx == input.count-1 {
            result.append(input)
            return
        }

        for i in startIdx..<input.count {
            input.swapAt(startIdx, i)
            backTrack(&result, &input, startIdx+1)
            input.swapAt(startIdx, i)
        }
    }
}
