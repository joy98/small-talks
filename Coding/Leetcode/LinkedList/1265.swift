//
//  1265.swift
//  Small Talks
//
//  Created by Joy Sarkar on 26/08/24.
//

import Foundation

/**
 * Definition for ImmutableListNode.
 * public class ImmutableListNode {
 *     public func printValue() {}
 *     public func getNext() -> ImmutableListNode? {}
 * }
 */

class Solution1265 {
    func printLinkedListInReverse(_ head: ImmutableListNode?) {
        if head == nil {
            return
        }
        printLinkedListInReverse(head?.getNext())
        print(head?.printValue())
    }
    
    public class ImmutableListNode {
        public func printValue() {}
        public func getNext() -> ImmutableListNode? { return ImmutableListNode()}
    }
}
