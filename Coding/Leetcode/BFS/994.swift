//
//  994.swift
//  Small Talks
//
//  Created by Joy Sarkar on 22/10/24.
//

import Foundation

class Solution994 {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var r = grid.count, c = grid[0].count
        var visited = Array(repeating: Array(repeating: false, count: c), count: r)

        var ans  = 0
        var queue: [(Int,Int)] = []
        var fresh = 0
        var grid1 = grid

        for i in 0..<r {
            for j in 0..<c {
                if grid[i][j] == 2 {
                    queue.append((i,j))
                } else if grid[i][j] == 1 {
                    fresh += 1
                }
            }
        }

        if fresh == 0 { return 0 }

        while(!queue.isEmpty) {
            var temp: [(Int,Int)] = []

            for e in queue {
                let (i,j) = e
                if visited[i][j] { continue }
                
                visited[i][j] = true
                grid1[i][j] = 2
                
                if (i-1) >= 0 && !visited[i-1][j] && grid[i-1][j] == 1 {
                    if !queue.contains(where: {$0 == i-1 && $1 == j}) {
                        temp.append((i-1,j))
                    }
                }

                if (i+1) < r && !visited[i+1][j] && grid[i+1][j] == 1 {
                    if !queue.contains(where: {$0 == i+1 && $1 == j}) {
                        temp.append((i+1,j))
                    }
                }

                if (j-1) >= 0 && !visited[i][j-1] && grid[i][j-1] == 1 {
                    if !queue.contains(where: {$0 == i && $1 == j-1}) {
                        temp.append((i,j-1))
                    }
                }

                if (j+1) < c && !visited[i][j+1] && grid[i][j+1] == 1 {
                    if !queue.contains(where: {$0 == i && $1 == j+1}) {
                        temp.append((i,j+1))
                    }
                }
            }

            queue = temp
            ans += 1
        }

        for i in 0..<r {
            for j in 0..<c {
                if grid1[i][j] == 1 {
                    return -1
                }
            }
        }
        
        return ans - 1
    }
}
