//
//  41.swift
//  Small Talks
//
//  Created by Joy Sarkar on 02/10/24.
//

import Foundation

class Solution41 {
    func firstMissingPositive(_ num: [Int]) -> Int {
        var nums = num
        var i = 0

        while( i < nums.count) {
            if (nums[i] <= nums.count) && (nums[i] > 0) && (nums[i] != nums[nums[i] - 1]) {
                var t = nums[i]
                nums[i] = nums[nums[i] - 1]
                nums[t - 1] = t
            } else {
                i += 1
            }
        }

        for i in 0..<nums.count {
            if (nums[i] != (i+1)) {
                return i+1;
            }
        }
        return nums.count + 1
    }
}
