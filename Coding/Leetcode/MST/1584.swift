//
//  1584.swift
//  Small Talks
//
//  Created by Joy Sarkar on 18/10/24.
//

import Foundation

class Solution1584 {
    class UnionFind {
        private var root: [Int]
        private var rank: [Int]
        private let size: Int

        init(size: Int) {
            self.size = size
            root = [Int](0..<size)
            rank = [Int](repeating: 0, count: size)
        }

        func find(_ node: Int) -> Int {
            if (node == root[node]) {
                return node
            }
            var parent = find(root[node])
            root[node] = parent
            return parent
        }

        func union(_ x: Int,_ y: Int) {
            let rootX = find(x)
            let rootY = find(y)

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

    // MARK: Kruskals algorithm
    func minCostConnectPointsWithKruskals(_ points: [[Int]]) -> Int {
        
        let pointCount = points.count
        let union = UnionFind(size: pointCount)
        var edges: [(Int,(Int,Int))] = []

        for i in 0..<pointCount {
            for j in i+1..<pointCount {
                let x = points[i], y = points[j]
                let weight = abs(x[0] - y[0]) + abs(x[1] - y[1])
                edges.append((weight,(i,j)))
            }
        }

        edges = edges.sorted { e1, e2 in
            return e1.0 < e2.0
        }

        var res = 0

        for edge in edges {
            let x = edge.1.0
            let y = edge.1.1
            let w = edge.0

            if union.find(x) != union.find(y) {
                res += w
                union.union(x,y)
            }
        }
        return res
    }
}

// the overall time complexity is O(N2+N2⋅log(N2)+N2⋅α(N)) ≈ O(N2⋅log(N2)) ≈ O(N2⋅log(N)).


import HeapModule

class Solution1584Prims {
    struct Edge: Comparable {
        let vertices: (a: Int, b: Int)
        let weight: Int

        static func < (_ lhs: Edge, _ rhs: Edge) -> Bool {
            return lhs.weight < rhs.weight
        }

        static func == (_ lhs: Edge, _ rhs: Edge) -> Bool {
            return lhs.weight == rhs.weight
        }
    }
    
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        return prims(points)
    }

    private func prims(_ points: [[Int]]) -> Int {
        let n = points.count
        var minHeap = Heap<Edge>()

        //start from point[0] and add all edges from it to other vertices
        let (x1, y1) = (points[0][0], points[0][1])
         for j in 1..<n {
            let (x2, y2) = (points[j][0], points[j][1])
            let distance = abs(x1 - x2) + abs(y1 - y2)
            let edge = Edge(vertices: (0, j) , weight: distance)
            minHeap.insert(edge)
        }

        var minCost = 0
        var edgeCount = n - 1
        var visited = Array(repeating: false, count: n)

        visited[0] = true

        while minHeap.isEmpty == false && edgeCount > 0 {
            let edge = minHeap.removeMin()
            let ((x, y), weight) = ((edge.vertices.a, edge.vertices.b), edge.weight)
            if visited[y] == false {
                minCost += weight
                visited[y] = true
                edgeCount -= 1

                for j in 0..<n where visited[j] == false {
                    let (x1, y1) = (points[j][0], points[j][1])
                    let (x2, y2) = (points[y][0], points[y][1])
                    let distance = abs(x2 - x1) + abs(y2 - y1)
                    let edge = Edge(vertices: (y, j) , weight: distance)
                    minHeap.insert(edge)
                }
            }
        }

        return minCost
    }
}
