//
//  34.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/09/24.
//

import Foundation

class Solution34 {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var s = 0 , e = nums.count - 1
        var l = -1, r = -1

        print("left bias")
        
        while(s<=e) {
            var m = (e-s)/2 + s
            if nums[m] == target {
                l = m
                e = m - 1
            } else if nums[m] < target {
                s = m + 1
            } else {
                e = m - 1
            }
        }

        s = 0
        e = nums.count - 1
        print("right bias")

        while(s<=e) {
            var m = (e-s)/2 + s
            if nums[m] == target {
                r = m
                s = m + 1
            } else if nums[m] < target {
                s = m + 1
            } else {
                e = m - 1
            }
        }

        return [l,r]
    }
}
