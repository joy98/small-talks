//
//  21.swift
//  Small Talks
//
//  Created by Joy Sarkar on 10/09/24.
//

import Foundation

class Solution21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var h: ListNode? = ListNode()
        var k = h
        var list2 = list2
        var list1 = list1

        while(list1 != nil || list2 != nil) {
            if list1 == nil {
                h?.next = list2
                list2 = list2?.next
                break
            } else if list2 == nil {
                h?.next = list1
                list1 = list1?.next
                break
            } else {
                var v1 = list1?.val ?? -100
                var v2 = list2?.val ?? -100
                if v1 < v2 {
                    h?.next = list1
                    list1 = list1?.next
                } else {
                    h?.next = list2
                    list2 = list2?.next
                }
            }
            print(h?.val)
            h = h?.next
        }

        return k?.next
    }
}
