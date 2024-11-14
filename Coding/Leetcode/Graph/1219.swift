//
//  1219.swift
//  Small Talks
//
//  Created by Joy Sarkar on 26/08/24.
//

import Foundation

class Solution1219 {
    var map: [Int: Int] = [:]
    // map is redundant here as if we even do memoisation, we will have to keep context of the previous gold values already selected.
    // eg : we cant memoise (i,j), we will have to do (val,i,j) which will be hugely complex.
    
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        var val = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                val = max(val, calculate(grid, i, j))
            }
        }
        return val
    }
    
    func calculate(_ grid: [[Int]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || j < 0 { return 0 }
        if i >= grid.count || j >= grid[i].count { return 0 }
        
        // if let k = map[i*10+j*100] {
        //     return k
        // }
        if grid[i][j] == 0 { return 0}
        
        var val = grid[i][j]
        var copy = grid
        copy[i][j] = 0
        
        var a = calculate(copy, i+1, j)
        var b = calculate(copy, i-1, j)
        var c = calculate(copy, i, j+1)
        var d = calculate(copy, i, j-1)
        
        map[i*10+j*100] = max(a,b,c,d) + val
        return max(a,b,c,d) + val
    }
}
