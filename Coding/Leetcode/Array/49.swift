//
//  49.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

class Solution49 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()

        for str in strs {
            let sortedStr = String(str.sorted())
            dict[sortedStr, default: []].append(str)
        }

        return Array(dict.values)
    }
}

class Solution49v2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Int]: [String]]()

        for str in strs {
            var counts = Array(repeating: 0, count: 26)
            for char in str {
                let index = Int(char.asciiValue! - 97)
                counts[index] += 1
            }
            dict[counts, default: []].append(str)
        }

        return Array(dict.values)
    }
}
