//
//  55.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

class Solution55 {
    func canJump(_ nums: [Int]) -> Bool {
        var indexToreach = 0
        var n = Array(nums.reversed())

        for i in 1..<n.count {
            if n[i] >= (i-indexToreach) {
                indexToreach = i
            }
        }

        

        return indexToreach == (nums.count - 1) ? true : false
    }
}


class Solution55v2 {
    func canJump(_ nums: [Int]) -> Bool {
        var indexToreach = nums.count - 1
        var i = nums.count - 1

        while(i >= 0) {
            if (nums[i] >= (indexToreach-i)) {
                indexToreach = i
            }
            i -= 1
        }

        return indexToreach == 0 ? true : false
    }
}
