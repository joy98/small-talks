//
//  91.swift
//  Small Talks
//
//  Created by Joy Sarkar on 19/09/24.
//

import Foundation

class Solution91 {

    var map:[Int: Int] = [:]

    func numDecodings(_ s: String) -> Int {
        return calculate(Array(s), 0)
    }

    func calculate(_ s: [Character], _ i: Int) -> Int {
        if let v = map[i] {
            return v
        }

        // Base cases
        if i == s.count {
            return 1
        }
        if i > s.count || s[i] == "0" {
            return 0
        }

        // Single digit decoding
        var result = calculate(s, i + 1)
        
        // Two digit decoding
        if i + 1 < s.count {
            let substring = String(s[i]) + String(s[i+1])
            if let value = Int(substring), value >= 10 && value <= 26 {
                result += calculate(s, i + 2)
            }
        }
        
        map[i] = result
        return result
    }
    
    func calculateWithString(_ s: String, _ i: Int) -> Int {
            if let v = map[i] {
                return v
            }

            // Base cases
            if i == s.count {
                return 1
            }
            if i > s.count || s[s.index(s.startIndex, offsetBy: i)] == "0" {
                return 0
            }

            // Single digit decoding
            var result = calculateWithString(s, i + 1)
            
            // Two digit decoding
            if i + 1 < s.count {
                let startIndex = s.index(s.startIndex, offsetBy: i)
                let endIndex = s.index(s.startIndex, offsetBy: i + 2)
                let substring = String(s[startIndex..<endIndex])
                if let value = Int(substring), value >= 10 && value <= 26 {
                    result += calculateWithString(s, i + 2)
                }
            }
            map[i] = result
            return result
        }
}
