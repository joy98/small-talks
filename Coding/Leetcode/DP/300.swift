//
//  300.swift
//  Small Talks
//
//  Created by Joy Sarkar on 27/10/24.
//

import Foundation

class Solution300 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var r = nums.count
        var dp = Array(repeating: 1, count: r)
        var m = 1

        for i in 0..<r {
            for j in (i+1)..<r {
                if nums[j] > nums[i] {
                    dp[j] = max(1+dp[i],dp[j])
                }
                m = max(m,dp[j])
            }
        }
        return m
    }
}
