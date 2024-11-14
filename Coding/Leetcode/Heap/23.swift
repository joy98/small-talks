//
//  23.swift
//  Small Talks
//
//  Created by Joy Sarkar on 20/09/24.
//

import Foundation
import Collections
import HeapModule


extension ListNode: Comparable {
    public static func < (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val < rhs.val
    }

    public static func > (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs.val > rhs.val
    }

    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs === rhs
    }
}

class Solution23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }

        var heap = Heap<ListNode>()

        for list in lists {
            if let head = list {
                heap.insert(head)
            }
        }

        let dummy = ListNode(0)
        var current: ListNode? = dummy

        while let minimum = heap.popMin() {
            current?.next = minimum
            current = current?.next

            if let next = minimum.next {
                heap.insert(next)
            }
        }

        return dummy.next
    }
}
