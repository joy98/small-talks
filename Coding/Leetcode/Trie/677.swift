//
//  677.swift
//  Small Talks
//
//  Created by Joy Sarkar on 14/10/24.
//

import Foundation


class Trie677 {

    class Node {
        var map: [Character: Node]
        var isEnd: Bool
        var val: Int

        init() {
            map = [:]
            isEnd = false
            val = 0
        }
    }
    

    private var rootNode: Node

    init() {
      rootNode = Node()
    }
    
    func insert(_ word: String, _ val: Int) {
        
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
        tempNode.val = val
    }
    
    func findSum(_ word: String) -> Int {
        var tempNode = rootNode
        var strArray = Array(word)

        for ch in strArray {
            if let val = tempNode.map[ch] {
                tempNode = val
            } else {
                return 0
            }
        }

        return calc(tempNode)
    }

    func calc(_ node: Node) -> Int {
        var k = node.val
        for i in node.map {
            k += calc(i.value)
        }
        return k
    }
}


class MapSum {
    var trie: Trie677

    init() {
        trie = Trie677()
    }
    
    func insert(_ key: String, _ val: Int) {
        trie.insert(key,val)
    }
    
    func sum(_ prefix: String) -> Int {
        return trie.findSum(prefix)
    }
}

/**
 * Your MapSum object will be instantiated and called as such:
 * let obj = MapSum()
 * obj.insert(key, val)
 * let ret_2: Int = obj.sum(prefix)
 */
