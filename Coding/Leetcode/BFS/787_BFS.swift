//
//  787_BFS.swift
//  Small Talks
//
//  Created by Joy Sarkar on 21/10/24.
//

import Foundation
import HeapModule

class Solution787_BFS {

    struct Node: Comparable, Hashable {
        var d,w,k: Int

        static func < (_ lhs: Node, _ rhs: Node) -> Bool {
            return lhs.d < rhs.d
        }
    }

    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var map: [Int: [Node]] = [:]

        for flight in flights {
            map[flight[0], default: []].append(Node(d: flight[1], w: flight[2], k: 0))
        }
        
        var heap = Heap<Node>()
        heap.insert(Node(d: src, w: 0, k: 0))

        var ans = Int.max
        var s = Set<Node>()

        while(!heap.isEmpty) {
            
            let top = heap.removeMin()
            let arr = map[top.d] ?? []
            
            if s.contains(top) {
                continue
            }
            s.insert(top)

            for node in arr {
                if node.d == dst && ((top.k) <= k) {
                    ans = min(node.w + top.w, ans)
                } else if ((top.k) < k && (node.w + top.w) < ans) {
                    heap.insert(Node(d: node.d, w: node.w + top.w, k: top.k+1))
                }
            }
        }

        return (ans == Int.max) ? -1 : ans
    }
}
