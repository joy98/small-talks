//
//  211.swift
//  Small Talks
//
//  Created by Joy Sarkar on 15/10/24.
//

import Foundation

class WordDictionary211 {

class Trie {

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
                print(ch)
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
        return recursiveSearch(strArray,0,rootNode)
    }

    func recursiveSearch(_ word: Array<Character>,_ index: Int,_ node: Node) -> Bool {
        if index >= word.count { return false }
        
        var ch = word[index]
        var v = false

        if let val = node.map[ch] {
            if val.isEnd && index == (word.count-1) {
                return true
            } else {
                return recursiveSearch(word, index + 1, val)
            }
        } else if ch == "." {
            for i in node.map {
                if index == (word.count - 1) && i.value.isEnd {
                return true
            }
                v = v || recursiveSearch(word, index + 1, i.value)
            }
            return v
        }
        return v
    }
}

    var trie: Trie

    init() {
        trie = Trie()
    }
    
    func addWord(_ word: String) {
        trie.insert(word)
    }
    
    func search(_ word: String) -> Bool {
        return trie.search(word)
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */
