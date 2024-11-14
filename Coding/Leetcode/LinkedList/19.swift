//
//  19.swift
//  Small Talks
//
//  Created by Joy Sarkar on 10/09/24.
//

import Foundation


class Solution19 {
    private var count = 0
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head else { return nil }

        var currentCount = count
        count += 1
        var next = removeNthFromEnd(head.next, n)

        if (count - n) == currentCount {
            return next
        }

        head.next = next
        return head
    }
}
