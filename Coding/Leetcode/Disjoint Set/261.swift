//
//  261.swift
//  Small Talks
//
//  Created by Joy Sarkar on 17/10/24.
//

import Foundation

class Solution261 {

    class Union {
        private var root: [Int] = []
        private var rank: [Int] = []
        private var size = 0

        init(size: Int) {
            self.size = size
            for i in 0..<size {
                root.append(i)
            }
            rank = Array(repeating: 0, count: size)
        }

        func union(_ x: Int,_ y: Int) -> Bool {
            if root[x] == root[y] {
                return false
            }

            if rank[x] < rank[y] {
                root[x] = parent(y)
                rank[x] += 1
            } else {
                root[y] = parent(x)
                rank[y] += 1
            }
            return true
        }

        func parent(_ node: Int) -> Int {
            if root[node] == node { return node}
            return parent(root[node])
        }

        func isValid() -> Bool {
            var s = Set<Int>()
            for i in 0..<size {
                s.insert(parent(i))
            }
            return s.count == 1
        }
    }

    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        let disjointSet = Union(size: n)

        for edge in edges {
            if !disjointSet.union(edge[0],edge[1]) {
                return false
            }
        }

        return disjointSet.isValid()
    }
}
