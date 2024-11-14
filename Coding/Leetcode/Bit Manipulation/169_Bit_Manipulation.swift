//
//  169_Bit_Manipulation.swift
//  Small Talks
//
//  Created by Joy Sarkar on 27/10/24.
//

import Foundation

class Solution169_Bit_Manipulation {
    class Solution {
        func majorityElement(_ nums: [Int]) -> Int {
            var ele = 0
            var n = nums.count

            for i in 0..<64 {
                var val = 1<<i
                var c = 0

                for j in nums {
                    if (j&val) != 0 {
                        c+=1
                    }
                }

                if (c > n/2) {
                    ele |= val
                }
            }
            
            return ele
        }
    }
}
