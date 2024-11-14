//
//  179.swift
//  Small Talks
//
//  Created by Joy Sarkar on 18/09/24.
//

import Foundation

class Solution179 {
    func largestNumber(_ nums: [Int]) -> String {
        let nums2 = nums.map { String($0) }
        let nums3 = nums2.sorted(by: { a,b in
            return a+b > b+a
        })
        
        var s = ""
        
        for i in nums3 {
            s += i
        }
        
        if nums3[0] == "0" {
            return "0"
        }
        
        return s
    }
}
