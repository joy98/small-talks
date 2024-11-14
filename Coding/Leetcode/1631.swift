//
//  1631.swift
//  Small Talks
//
//  Created by Joy Sarkar on 21/10/24.
//

import Foundation
import HeapModule

class Solution1631 {

    struct Edge: Comparable {
        var r,c,w: Int

        static func < (_ lhs: Edge, _ rhs: Edge) -> Bool {
            return lhs.w < rhs.w
        }
    }

    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        var r = heights.count, c = heights[0].count
        var visited = Array(repeating: Array(repeating: false, count: c), count: r)
        var val = Array(repeating: Array(repeating: Int.max, count: c), count: r)
        val[0][0] = 0

        var heap = Heap<Edge>()
        heap.insert(Edge(r: 0, c: 0, w: 0))

        while(!heap.isEmpty) {
            let edge = heap.removeMin()
            if visited[edge.r][edge.c] {
                continue
            }
            visited[edge.r][edge.c] = true
            
            if (edge.r - 1) >= 0 && !visited[edge.r - 1][edge.c] {
                let w = abs(heights[edge.r - 1][edge.c] - heights[edge.r][edge.c])
                var v = max(w,val[edge.r][edge.c])
                if val[edge.r - 1][edge.c] > v {
                    val[edge.r - 1][edge.c] = v
                    heap.insert(Edge(r: edge.r - 1,c: edge.c, w: v))
                }
            }

            if (edge.r + 1) < r  && !visited[edge.r + 1][edge.c] {
                let w = abs(heights[edge.r + 1][edge.c] - heights[edge.r][edge.c])
                var v = max(w,val[edge.r][edge.c])
                if val[edge.r + 1][edge.c] > v {
                    val[edge.r + 1][edge.c] = v
                    heap.insert(Edge(r: edge.r + 1,c: edge.c, w: v))
                }
            }

            if (edge.c - 1) >= 0  && !visited[edge.r][edge.c - 1] {
                let w = abs(heights[edge.r][edge.c] - heights[edge.r][edge.c - 1])
                var v = max(w,val[edge.r][edge.c])
                if val[edge.r][edge.c - 1] > v {
                    val[edge.r][edge.c - 1] = v
                    heap.insert(Edge(r: edge.r,c: edge.c - 1, w: v))
                }
            }

            if (edge.c + 1) < c  && !visited[edge.r][edge.c + 1] {
                let w = abs(heights[edge.r][edge.c] - heights[edge.r][edge.c + 1])
                var v = max(w,val[edge.r][edge.c])
                
                if val[edge.r][edge.c + 1] > v {
                    val[edge.r][edge.c + 1] = v
                    heap.insert(Edge(r: edge.r,c: edge.c + 1, w: v))
                }
            }
        }
        
        return val[r-1][c-1]
    }
}
