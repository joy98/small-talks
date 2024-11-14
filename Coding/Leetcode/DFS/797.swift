//
//  797.swift
//  Small Talks
//
//  Created by Joy Sarkar on 22/10/24.
//

import Foundation

class Solution797 {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        var ans: [[Int]] = []
        var visited = Array(repeating: false, count: graph.count)

        dfs(graph, visited, 0, &ans, [])
        return ans
    }

    func dfs(_ graph: [[Int]], _ visited: [Bool], _ node: Int, _ ans: inout [[Int]], _ temp: [Int]) {

        var t = temp
        t.append(node)

        if node == (graph.count - 1) {
            ans.append(t)
        }
        if visited[node] { return }
        
        var v = visited
        v[node] = true

        for arr in graph[node] {
            dfs(graph,v,arr,&ans,t)
        }
    }
}
