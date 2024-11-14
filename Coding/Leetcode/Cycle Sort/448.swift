//
//  448.swift
//  Small Talks
//
//  Created by Joy Sarkar on 02/10/24.
//

import Foundation

class Solution448 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var n = nums
        var c = nums.count
        var i = 0

        while(i < c) {
            if n[i] <= c && n[i] != n[n[i] - 1] {
                var t = n[i]
                n[i] = n[t-1]
                n[t-1] = t
            } else {
                i += 1
            }
        }

        var r : [Int] = []

        for i in 0..<c {
            if (i+1) != n[i] {
                r.append(i+1)
            }
        }
        return r
    }
}
