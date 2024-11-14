//
//  855_Swift.swift
//  Small Talks
//
//  Created by Joy Sarkar on 19/09/24.
//

import Foundation

class ExamRoom {
    struct SeatRange: Comparable {
        let start: Int
        let end: Int

        let len: Int

        init(start: Int, end: Int, max: Int) {
            self.start = start
            self.end = end
            if start == -1 {
                self.len = end
            } else if end == max {
                self.len = max - 1 - start
            } else {
                self.len = abs(start - end) / 2
            }
        }

        static func <(lhs: SeatRange, rhs: SeatRange) -> Bool {
            lhs.len < rhs.len || (lhs.len == rhs.len && lhs.start > rhs.start)
        }
    }
    private let heap = Heap1<SeatRange>(comparator: >)
    private let roomSize: Int

    init(_ n: Int) {
        roomSize = n
        let seatRange = SeatRange(start: -1, end: n, max: n)
        heap.push(seatRange)
    }
    
    func seat() -> Int {
        guard let most = heap.pop() else { return -1 }

        let seat: Int
        if most.start == -1 {
            seat = 0
        } else if most.end == roomSize {
            seat = roomSize - 1
        } else {
            seat = most.start + (most.end - most.start)/2
        }
        let first = SeatRange(start: most.start, end: seat, max: roomSize)
        let sec = SeatRange(start: seat, end: most.end, max: roomSize)
        heap.push(first)
        heap.push(sec)

        return seat
    }
    
    func leave(_ p: Int) {
        let first = heap.remove(predicate: { range in
            range.end == p
        })
        let second = heap.remove(predicate: { range in
            range.start == p
        })
        guard let first = first, let second = second else { return }
        let merged = SeatRange(start: first.start, end: second.end, max: roomSize)
        heap.push(merged)
    }
}

final class Heap1<T> {
    private let isMost: (T, T) -> Bool
    private var pool = [T?](repeating: nil, count: 1)

    var size: Int { pool.count - 1 }

    init(comparator: @escaping (T, T) -> Bool) {
        self.isMost = comparator
    }

    func push(_ value: T) {
        pool.append(value)
        siftUp(pool.count - 1)
    }

    func remove(predicate: (T) -> Bool) -> T? {
        var foundIndex: Int?
        for i in stride(from: 1, to: pool.count, by: 1) {
            guard let item = pool[i] else { continue }
            if predicate(item) {
                foundIndex = i
                break
            }
        }
        guard let index = foundIndex else { return nil }
        pool.swapAt(index, pool.count - 1)
        let removed = pool.popLast()!
        if pool.count > 1 && index != pool.count {
            if isMost(removed!, pool[index]!) {
                siftDown(index)
            } else {
                siftUp(index)
            }
        }
        return removed
    }

    func pop() -> T? {
        guard pool.count > 1 else { return nil }
        pool.swapAt(1, pool.count - 1)
        let most = pool.popLast()!
        siftDown(1)
        return most
    }

    func getMost() -> T? {
        guard pool.count > 1 else { return nil }
        return pool[1]
    }

    private func siftUp(_ index: Int) {
        guard index > 0 else { return }
        var v = index
        while v > 1, isMost(pool[v]!, pool[v / 2]!) {
            pool.swapAt(v, v / 2)
            v = v / 2
        }
    }

    private func siftDown(_ index: Int) {
        guard index > 0 else { return }
        let n = pool.count - 1
        var v = index
        while 2 * v <= n {
            let left = 2 * v
            let right = 2 * v + 1
            let childIndex = right <= n && isMost(pool[right]!, pool[left]!) ? right : left
            if isMost(pool[v]!, pool[childIndex]!) {
                break
            }
            pool.swapAt(v, childIndex)
            v = childIndex
        }
    }
}
