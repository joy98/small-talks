//
//  852.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/09/24.
//

import Foundation

class Solution852 {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        
        var s = 0, r = arr.count - 1

        while(s < r) {
            var m = (r-s)/2 + s
            if (arr[m] < arr[m + 1]) {
                s = m + 1;
            }
            else {
                r = m;
            }
        }

        return s
    }
}
