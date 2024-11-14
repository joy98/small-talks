//
//  76.swift
//  Small Talks
//
//  Created by Joy Sarkar on 28/09/24.
//

import Foundation

class Solution76 {
    func minWindow(_ s: String, _ t: String) -> String {
        var tMap: [Character: Int] = [:]
        var map: [Character: Int] = [:]
        var l = 0
        var r = 0
        var length = Int.max
        var tuple = (l, r)
        let arr = Array(s)

        for element in t {
            tMap[element, default: 0] += 1
        }

        var need = tMap.count
        var have = 0

        for r in 0..<s.count {
            let char = arr[r]
            map[char, default: 0] += 1
            
            if tMap[char] != nil, tMap[char] == map[char] {
                have += 1
            }

            while have == need {
                if r - l + 1 < length {
                    length = r - l + 1
                    tuple = (l, r)
                }

                map[arr[l], default: 0] -= 1

                if tMap[arr[l]] != nil, map[arr[l]]! < tMap[arr[l]]! {
                    have -= 1
                }
                l += 1
            }
        }

        if length < Int.max {
            return String(arr[tuple.0...tuple.1])
        }

        return ""
    }
}
