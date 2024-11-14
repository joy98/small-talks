//
//  53.swift
//  Small Talks
//
//  Created by Joy Sarkar on 28/09/24.
//

import Foundation

class Solution53 {
    func maxSubArray(_ nums: [Int]) -> Int {
        var m = nums[0]
        var k = nums[0]

        for i in 1..<nums.count {
            k+=nums[i]
            k = max(nums[i],k)
            m = max(m,k)
        }
        return m
    }
}
