//
//  78.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

class Solution78 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ans: [[Int]] = []
        func calc(_ nums: [Int], _ curr: [Int], _ ans: inout [[Int]], _ i: Int) {
            if i == nums.count {
                ans.append(curr)
                return
            }
            calc(nums,curr,&ans,i+1)
            calc(nums,curr+[nums[i]],&ans,i+1)
        }

        calc(nums,[],&ans,0)
        return ans
    }
}
