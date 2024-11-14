//
//  3289.swift
//  Small Talks
//
//  Created by Joy Sarkar on 16/09/24.
//

import Foundation

class Solution3289 {
    func getSneakyNumbers(_ nums: [Int]) -> [Int] {
        var xr = 0;
        var m = nums.count
        var n = nums.count-2;

        for i in 0..<m {
            xr = xr^nums[i];
        }

        for i in 0..<n {
            xr = xr^i;
        }

        var right = xr & ~(xr-1)

        var t1 = 0;
        var t2 = 0;

        for i in 0..<m {
            if(nums[i]&right != 0) {
                t1 = t1^nums[i];
            }
            else {t2 = t2^nums[i];}
        }
        
        for i in 0..<n {
            if(i&right != 0) {
                t1 = t1^i;
            }
            else {t2 = t2^i;}
        }

        return [t1, t2];
    }
}
