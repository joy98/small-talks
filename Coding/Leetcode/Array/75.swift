//
//  75.swift
//  Small Talks
//
//  Created by Joy Sarkar on 27/10/24.
//

import Foundation

class Solution75 {
    func sortColors(_ nums: inout [Int]) {
        let n = nums.count
        var lo = 0, hi = n - 1
        var nextZeroIndex = 0, nextTwoIndex = n - 1
        
        while lo <= hi {
            if nums[lo] == 0 {
                nums.swapAt(lo,nextZeroIndex)
                nextZeroIndex += 1
                lo += 1
            } else if nums[lo] == 2 {
                nums.swapAt(lo,nextTwoIndex)
                nextTwoIndex -= 1
                hi -= 1
            } else {
                lo += 1
            }
        }
    }
}
// MARK: Dutch flag problem : we just fix 0's and 2's and correct positions, 1's would be present at coreect position by default.
