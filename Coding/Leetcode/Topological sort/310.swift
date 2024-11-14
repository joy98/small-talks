//
//  310.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/10/24.
//

import Foundation

class Solution310 {
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
       var result = [Int]()
    if n == 1 {
        result.append(0)
        return result
    }
    
    var adjList = [[Int]](repeating: [], count: n)
    var degree = [Int](repeating: 0, count: n)
    
    for edge in edges {
        adjList[edge[0]].append(edge[1])
        adjList[edge[1]].append(edge[0])
        degree[edge[0]] += 1
        degree[edge[1]] += 1
    }
    
    var leaves = [Int]()
    for i in 0..<n {
        if degree[i] == 1 {
            leaves.append(i)
        }
    }
    
    var remainingNodes = n
    while remainingNodes > 2 {
        let size = leaves.count
        remainingNodes -= size
        for _ in 0..<size {
            let leaf = leaves.removeFirst()
            for neighbor in adjList[leaf] {
                degree[neighbor] -= 1
                if degree[neighbor] == 1 {
                    leaves.append(neighbor)
                }
            }
        }
    }
    
    result = leaves
    return result
    }
}
