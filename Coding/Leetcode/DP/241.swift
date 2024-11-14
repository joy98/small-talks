//
//  241.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/09/24.
//

import Foundation

class Solution241 {
func diffWaysToCompute(_ expression: String) -> [Int] {
    let exp = Array(expression).map {String($0)}
    print(exp)
    var dp : [[Int]: [Int]] = [:]
    return helper(exp: exp, start: 0, end: exp.count - 1, dp: &dp)
}

func helper(exp: [String], start: Int, end: Int, dp: inout [[Int]: [Int]]) -> [Int] {
    var res: [Int] = []
    
    if let dpRes = dp[[start,end]] {
        return dpRes
    }
    
    // base case, single digit left ex: 4
    if start == end {
        let num = Int(exp[start])!
        res.append(num)
        return res
    }
    
    // base case, double digit like 44
    if end-start == 1, let num = Int(exp[start]) {
        let num = Int(exp[start...end].joined())!
        res.append(num)
    }
    
    // split
    for i in start...end {
        if let digit = Int(exp[i]) {
            continue
        }
        
        let op = exp[i]
        
        // if it is a symbol divide it left and right by split
        let left = helper(exp: exp, start: start, end: i-1, dp: &dp)
        let right = helper(exp: exp, start: i+1, end: end, dp: &dp)
        
        for i in left {
            for j in right {
                if op == "*" {
                    res.append(i*j)
                } else if op == "+" {
                    res.append(i+j)
                } else if op == "-" {
                    res.append(i-j)
                }
            }
        }
    }
    dp[[start,end]] = res
    return res
}
}
