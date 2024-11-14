//
//  152.swift
//  Small Talks
//
//  Created by Joy Sarkar on 16/09/24.
//

import Foundation

class Solution152 {

    struct Val : Hashable {
        var a: Int
        var b: Int
    }

    var map: [Val: Int] = [:]

    func maxProduct(_ nums: [Int]) -> Int {
        let v = max(calculate(nums,1,nums[0]), calculate(nums,1,Int.min))
        return v
    }

    func calculate(_ nums: [Int], _ i: Int, _ s: Int) -> Int {
        if i == nums.count {
            return s
        }

        if let v = map[Val(a:i,b:s)] {
            return v
        }

        var k = nums[i]
        if s != Int.min { k = k*s}

        let l = calculate(nums,i+1,k)
        let r = calculate(nums,i+1,Int.min)
        
        map[Val(a:i,b:s)] = max(r,k,l,nums[i],s)

        return max(r,k,l,nums[i],s)
    }
}
