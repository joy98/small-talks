//
//  73.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

class Solution73 {
    func setZeroes(_ m: inout [[Int]]) {
        var r = m.count
        var c = m[0].count
        var k = false

        for i in 0..<r {
            if m[i][0] == 0 {
                k = true
            }

            for j in 1..<c {
                if m[i][j] == 0 {
                    m[0][j] = 0
                    m[i][0] = 0
                }
            }
        }

        for i in 1..<r {
            for j in 1..<c {
                if m[0][j] == 0 || m[i][0] == 0 {
                    m[i][j] = 0
                }
            }
        }

        if (m[0][0] == 0) {
            for j in 0..<c {
                m[0][j] = 0
            }
        }

        if (k) {
            for i in 0..<r {
                m[i][0] = 0
            }
        }
    }
}
