//
//  218 Skyline.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/09/24.
//

import Foundation
import HeapModule


class Solution218 {
    struct Val: Comparable {
        var x: Int
        var h: Int
        var s: Bool

        static func < (lhs: Val, rhs: Val) -> Bool {
            if lhs.x == rhs.x {
                if lhs.s == rhs.s {
                    if lhs.s == true {
                        return lhs.h > rhs.h
                    } else {
                        return lhs.h < rhs.h
                    }
                }
                return lhs.s == true
            }
            return lhs.x < rhs.x
        }

        static func > (lhs: Val, rhs: Val) -> Bool {
            return lhs.x > rhs.x
        }

        static func == (lhs: Val, rhs: Val) -> Bool {
            return lhs.x == rhs.x
        }
    }
    
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var heap = Heap<Int>()
        var res: [[Int]] = []
        var arr: [Val] = []

        for i in buildings {
            arr.append(Val(x: i[0], h: i[2], s: true))
            arr.append(Val(x: i[1], h: i[2], s: false))
        }

        arr = arr.sorted()
        heap.insert(0)

        for i in arr {
            print(i)

            let v = i.h
            let m = heap.max ?? 0

            if i.s {
                if v > m {
                    res.append([i.x, i.h])
                }
                heap.insert(i.h)
            } else {

                var temp: [Int] = []

                while(!heap.isEmpty) {
                    var k = heap.removeMax()
                    if k == i.h {
                        break
                    } else {
                        temp.append(k)
                    }
                }
                
                for i in temp {
                    heap.insert(i)
                }

                let nm = heap.max ?? 0

                if nm != m {
                    res.append([i.x, nm])
                }
            }
        }

        print(heap.max)

        return res
    }
}
