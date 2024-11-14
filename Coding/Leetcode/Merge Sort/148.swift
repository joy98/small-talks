//
//  148.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/10/24.
//

import Foundation

// MARK: Merge Sort Implementation
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        return mergeSort(head)
    }

    func mergeSort(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil}
        if head == nil || head.next == nil { return head }

        let mid = findMid(head)
        let leftHead = mergeSort(head)
        let rightHead = mergeSort(mid)
        return combine(leftHead,rightHead)
    }

    func combine(_ h1: ListNode?, _ h2: ListNode?) -> ListNode? {
        var dummy: ListNode? = ListNode()
        let tempHead = dummy
        var head1 = h1
        var head2 = h2

        while((head1 != nil) && (head2 != nil)) {
            if head1?.val ?? Int.max < head2?.val ?? Int.max {
                dummy?.next = head1
                head1 = head1?.next
            } else {
                dummy?.next = head2
                head2 = head2?.next
            }
            dummy = dummy?.next
        }

        if head1 != nil {
            dummy?.next = head1
        }

        if head2 != nil {
            dummy?.next = head2
        }

        return tempHead?.next
    }

    func findMid(_ h: ListNode) -> ListNode? {
        var head: ListNode? = h
        var prev: ListNode? = head
        var mid: ListNode? = head

        while(head != nil && head?.next != nil) {
            prev = mid
            mid = mid?.next
            head = head?.next?.next
        }
        prev?.next = nil
        return mid
    }
}
