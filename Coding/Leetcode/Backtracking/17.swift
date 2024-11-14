//
//  17.swift
//  Small Talks
//
//  Created by Joy Sarkar on 25/10/24.
//

import Foundation

class Solution17 {
    func letterCombinations(_ digits: String) -> [String] {
        var map: [Character: [Character]] = [:]

        map["2"] = ["a","b","c"]
        map["3"] = ["d","e","f"]
        map["4"] = ["g","h","i"]
        map["5"] = ["j","k","l"]
        map["6"] = ["m","n","o"]
        map["7"] = ["p","q","r","s"]
        map["8"] = ["t","u","v"]
        map["9"] = ["w","x","y","z"]

        var ans: [String] = []
        backtrack(Array(digits),0,&map,&ans,"")
        return ans
    }

    func backtrack(_ digits: [Character], _ index: Int, _ map: inout [Character: [Character]], _ ans: inout [String], _ curr: String) {
        if index == digits.count {
            if !curr.isEmpty {
                ans.append(curr)
            }
            return
        }

        let mp = map[digits[index], default: []]

        for i in mp {
            backtrack(digits,index+1,&map,&ans,curr+String(i))
        }
    }
}
