//
//  3.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/10/24.
//

import Foundation

class Solution3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = Array(repeating: -1, count: 129)
        var ans = Array<Character>()
        var m = 0

        for ch in Array(s) {
            if let val = ch.asciiValue {
                if map[Int(val)] != -1 {
                var temp = Array<Character>()
                for i in ans {
                    if i == ch {
                        temp = []
                    } else {
                        temp.append(i)
                    }
                }
                temp.append(ch)
                ans = temp
                } else {
                    ans.append(ch)
                    map[Int(val)] = 1
                }
            }
            m = max(m,ans.count)
        }

        return m
    }
}

// We are just concerned with start index, not the actual elements
class Solution3Optimised {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var map = Array(repeating: -1, count: 129)
        var m = 0
        var start = 0

        for (j,ch) in Array(s).enumerated() {
            if let val = ch.asciiValue {
                if map[Int(val)] != -1 {
                    start = max((map[Int(val)] + 1), start)
                    // keep in mind that start can't be decremented once it has achieved a higher value
                }
                map[Int(val)] = j
            }
            m = max(m,(j - start + 1))
        }

        return m
    }
}
