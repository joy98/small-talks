//
//  208.swift
//  Small Talks
//
//  Created by Joy Sarkar on 14/10/24.
//

import Foundation

class Trie208 {

    class Node {
        var map: [Character: Node]
        var isEnd: Bool

        init() {
            map = [:]
            isEnd = false
        }
    }
    

    private var rootNode: Node

    init() {
      rootNode = Node()
    }
    
    func insert(_ word: String) {
        
        var tempNode = rootNode
        var strArray = Array(word)

        for ch in strArray {
            if let val = tempNode.map[ch] {
                tempNode = val
            } else {
                let newNode = Node()
                tempNode.map[ch] = newNode
                tempNode = newNode
            }
        }
        tempNode.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var tempNode = rootNode
        var strArray = Array(word)

        for ch in strArray {
            if let val = tempNode.map[ch] {
                tempNode = val
            } else {
                return false
            }
        }

        return tempNode.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var tempNode = rootNode
        var strArray = Array(prefix)

        for ch in strArray {
            if let val = tempNode.map[ch] {
                tempNode = val
            } else {
                return false
            }
        }

        return true
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
