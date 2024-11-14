//
//  62.swift
//  Small Talks
//
//  Created by Joy Sarkar on 25/10/24.
//

import Foundation

class Solution62 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[0][0] = 1

        for i in 0..<m {
            for j in 0..<n {
                if (i-1) >= 0 {
                    dp[i][j] += dp[i-1][j]
                }

                if (j-1) >= 0 {
                    dp[i][j] += dp[i][j-1]
                }
            }
        }

        return dp[m-1][n-1]
    }
}
