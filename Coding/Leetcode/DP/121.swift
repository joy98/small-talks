//
//  121.swift
//  Small Talks
//
//  Created by Joy Sarkar on 15/09/24.
//

import Foundation

class Solution121 {

    struct Val: Equatable, Hashable {
        let a: Int
        let b: Int
    }

    var map: [Val: Int] = [:]

    func maxProfit(_ prices: [Int]) -> Int {
        return calculate(prices,0, -1)
    }

    func calculate(_ prices: [Int], _ i: Int, _ b: Int) -> Int {
        if let val = map[Val(a: i,b: b)] {
            return val
        }

        if i == prices.count { return 0 }
        
        if b == -1 {
            var l = calculate(prices,i+1,prices[i])
            var r = calculate(prices,i+1,-1)
            map[Val(a: i,b: b)] = max(l,r)
            return max(l,r)
        } else if b <= prices[i] {
            var l =  calculate(prices,i+1,-1)
            var r = calculate(prices,i+1,b)
             map[Val(a: i,b: b)] = max(l,r,prices[i] - b)
            return max(l,r,prices[i] - b)
        }
        return 0
    }
}
