//
//  1136.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/10/24.
//

import Foundation

class Solution1136 {
    func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
        var map: [Int: [Int]] = [:]
        var degree = [Int](repeating: 0, count: n + 1)
        var leaves: [Int] = []

        for r in relations {
            let (x,y) = (r[0], r[1])
            map[x, default: []].append(y)
            degree[y] += 1
        }

        for i in 1...n {
            if degree[i] == 0 {
                leaves.append(i)
            }
        }

        var ans = 0, r = n

        while(!leaves.isEmpty) {
            var temp: [Int] = []
            ans += 1
            r -= leaves.count
            
            for i in leaves {
                for j in (map[i] ?? []) {
                    degree[j] -= 1
                    if degree[j] == 0 {
                        temp.append(j)
                    }
                }
            }
            leaves = temp
        }

        return r == 0 ? ans : -1
    }
}
