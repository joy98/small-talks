//
//  322.swift
//  Small Talks
//
//  Created by Joy Sarkar on 16/09/24.
//

import Foundation

class Solution322_Top_Down {

    var map: [Int:Int] = [:]

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        return calculate(coins,amount)
    }

    func calculate(_ coins: [Int], _ amount: Int) -> Int {
        if amount < 0 { return -1 }
        if amount == 0 { return 0 }
        if let v = map[amount] { return v}

        var m = -1

        for i in coins {
            let take = calculate(coins,amount-i)

            if take != -1 {
                if m == -1 {
                    m = take + 1
                } else {
                    m = min(m,take + 1)
                }
            }
        }

        map[amount] = m
        return m
    }
}

class Solution322_Bottom_Up {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }

        var dp = Array(repeating: Int.max, count: amount + 1)

        for i in coins {
            if i <= amount {
                dp[i] = 1
            }
        }

        for i in 1...amount {
            if dp[i] != Int.max { continue }
            var val = Int.max
            for j in 0..<coins.count {
                if (i-coins[j]) >= 0 {
                    if dp[i-coins[j]] != Int.max {
                        val = min(val,(1+dp[i-coins[j]]))
                    }
                }
            }
            dp[i] = val
        }

        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}
