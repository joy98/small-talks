//
//  1202.swift
//  Small Talks
//
//  Created by Joy Sarkar on 17/10/24.
//

import Foundation

class Solution1202 {
    class UnionFind {
        private var root: [Int]
        private var rank: [Int]
        private let size: Int

        init(size: Int) {
            self.size = size
            root = [Int](0..<size)
            rank = [Int](repeating: 0, count: size)
        }

        func find(node: Int) -> Int {
            if (node == root[node]) {
                return node;
            }
            var parent = find(node: root[node])
            root[node] = parent
            return parent;
        }

        func union(x: Int, y: Int) {
            let rootX = find(node: x)
            let rootY = find(node: y)

            if (rootX != rootY) {
            if (rank[rootX] >= rank[rootY]) {
                root[rootY] = rootX
                rank[rootX] += rank[rootY]
            } else {
                root[rootX] = rootY
                rank[rootY] += rank[rootX]
            }
        }
        }
    }
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {

        let unionFind = UnionFind(size: s.count)
        for pair in pairs {
            unionFind.union(x: pair[0], y: pair[1])
        }

        var map: [Int: [(Int,Character)]] = [:]
        var charArray = Array(s)
        var res = charArray

        for i in 0..<s.count {
            let root = unionFind.find(node: i)
            if let v = map[root] {
                map[root]?.append((i,charArray[i]))
            } else {
                map[root] = [(i,charArray[i])]
            }
        }

        for i in map {
            var arr = i.value.sorted() { e1, e2 in
                return e1.1 < e2.1
            }

            var arr2 = i.value.sorted() { e1, e2 in
                return e1.0 < e2.0
            }

            for j in 0..<arr.count {
                res[arr2[j].0] = arr[j].1
            }
        }
        return String(res)
    }
}
