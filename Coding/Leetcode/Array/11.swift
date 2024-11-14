//
//  11.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

class Solution11 {
    func maxArea(_ height: [Int]) -> Int {
        var ans = 0
        var st = 0, ed = height.count - 1

        while(st<ed) {
            ans = max(ans,min(height[st],height[ed]) * (ed-st))
            if height[st] < height[ed] {
                st += 1
            } else {
                ed -= 1
            }
        }
        
        return ans
    }
}
