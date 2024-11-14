//
//  169.swift
//  Small Talks
//
//  Created by Joy Sarkar on 27/10/24.
//

import Foundation

class Solution169_booyer_moore_voting {
    func majorityElement(_ nums: [Int]) -> Int {
        var c = 0, prev = 0

        for i in nums {
            if c == 0 {
                prev = i
            }
            if prev == i {
                c += 1
            } else {
                c -= 1
            }
        }
        return prev
    }
}

// MARK: If any element is appearing more than n/2 times, prev will be equal to that element, as counts of items occuring less than n/2 times will get cancelled.
