//
//  295.swift
//  Small Talks
//
//  Created by Joy Sarkar on 28/09/24.
//

import Foundation
import HeapModule

class MedianFinder295 {

    var maxHeap = Heap<Int>()
    var minHeap = Heap<Int>()
    init() {}
    
    func addNum(_ num: Int) {
        //we could use min and max heaps
        //Left half will be in max heap and right half will be in min heap and it is O(1) time to find the top elements and find median
        //Always insert in the max heap and if the count of max heap > 1 + min heap, then shift the max element to min heap to balance it

        //1. first insert into the right heap
        if maxHeap.isEmpty || num < maxHeap.max! {
            maxHeap.insert(num)
        } else {
            minHeap.insert(num)
        }

        //2. re-balance the heaps
        if maxHeap.count > 1 + minHeap.count {
            //rebalance
            minHeap.insert(maxHeap.removeMax())
        } else if maxHeap.count < minHeap.count {
            maxHeap.insert(minHeap.removeMin())
        }
    }
        
    func findMedian() -> Double {
        guard maxHeap.count == minHeap.count else {
            return Double(maxHeap.max!)
        }

        let max = maxHeap.max!
        let min = minHeap.min!
        return (Double(max) + Double(min)) / 2.0
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
