//
//  743.swift
//  Small Talks
//
//  Created by Joy Sarkar on 18/10/24.
//

import Foundation
import HeapModule


class Solution743 {
    struct Pair: Comparable {
        let dest: Int
        let weight: Int

        static func < (_ lhs: Pair, _ rhs: Pair) -> Bool {
            return lhs.weight < rhs.weight
        }
    }
    
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var graph = Array(repeating: [Pair](), count: n)

        for time in times {
            let (source, dest, weight) = (time[0] - 1, time[1] - 1, time[2])
            graph[source].append(Pair(dest: dest, weight: weight))
        }

        var minHeap = Heap<Pair>()
        minHeap.insert(Pair(dest: k - 1, weight: 0))
        var visited = Set<Int>()
        var len = 0

        while minHeap.isEmpty == false {
            let node = minHeap.removeMin() //always visit the nearest node
            if visited.contains(node.dest) { continue } //avoid loop
            
            visited.insert(node.dest)
            len = max(len, node.weight) //we need to choose the max because we need to know the delay

            for neighbor in graph[node.dest] {
                guard visited.contains(neighbor.dest) == false else { continue }

                let newWeight = node.weight + neighbor.weight
                minHeap.insert(Pair(dest: neighbor.dest, weight: newWeight))
            }
        }

        return visited.count == n ? len : -1
    }
}
