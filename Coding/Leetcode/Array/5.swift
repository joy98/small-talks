//
//  5.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/10/24.
//

import Foundation

class Solution5 {
    // MARK: Expand around the centers approach
    func longestPalindrome(_ s: String) -> String {
        var arr = Array(s)
        var ans = ""

        for i in 0..<arr.count {

            var cur: String = "", cur2: String = ""
            var k = false

            cur += String(arr[i])
            cur2 += String(arr[i])
            if (i+1) < arr.count && arr[i] == arr[i+1] {
                cur2 += String(arr[i+1])
                k = true
            }

            var st = i-1, ed = i+1
            var v1 = -1, v2 = -1

            while(st>=0 && ed<(arr.count) && arr[st]==arr[ed]) {
                v1 = st
                v2 = ed
                st -= 1
                ed += 1
            }

            if v1 != -1 {
                cur = String(arr[v1...v2])
            }

            st = i-1
            ed = i+2
            v1 = -1
            v2 = -1
            while(st>=0 && ed<(arr.count) && arr[st]==arr[ed] && k) {
                v1 = st
                v2 = ed
                st -= 1
                ed += 1
            }
            if v1 != -1 {
                cur2 = String(arr[v1...v2])
            }
            

            if cur.count > ans.count {
                ans = cur
            }

            if cur2.count > ans.count {
                ans = cur2
            }
        }
        return ans
    }
}
