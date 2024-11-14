//
//  621 Task Scheduler.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/09/24.
//

import Foundation

import HeapModule

struct Val: Comparable {
    var ch: Character
    var count: Int

    static func < (lhs: Val, rhs: Val) -> Bool {
        lhs.count < rhs.count
    }

    static func > (lhs: Val, rhs: Val) -> Bool {
        lhs.count > rhs.count
    }

    static func == (lhs: Val, rhs: Val) -> Bool {
        lhs.count == rhs.count
    }
}

class Solution621 {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var map:[Character: Int] = [:]
        var heap = Heap<Val>()

        for i in tasks {
            if let v = map[i] {
                map[i] = v+1
            } else {
                map[i] = 1
            }
        }

        for i in map {
            heap.insert(Val(ch: i.key, count: i.value))
        }

        var k = 0

        while(true) {
            if heap.isEmpty {
                break
            }

            var cooldown = n + 1
            var arr: [Val] = []
            var valid = 0

            while(!heap.isEmpty && cooldown != 0) {
                if let v = heap.popMax() {
                    if v.count != 1 {
                        arr.append(Val(ch: v.ch, count: v.count - 1))
                    }
                    valid += 1
                }
                k+=1
                cooldown -= 1
            }
            
            if valid < n+1 && !arr.isEmpty {
                k += (n+1-valid)
            }

            for e in arr {
                heap.insert(e)
            }
        }

        return k
    }
}
