//
//  253.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/09/24.
//

import Foundation

import HeapModule
class Solution253 {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
      let intervals = intervals.sorted { $0[0] < $1[0] }
        var heap: Heap<Int> = []
        for i in 0..<intervals.count {
            if let v = heap.min , intervals[i][0] >= v   {
                heap.popMin()
            }
            heap.insert(intervals[i][1])
        }
        return heap.count
    }
}
