//
//  648.swift
//  Small Talks
//
//  Created by Joy Sarkar on 14/10/24.
//

import Foundation

class Solution648 {
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
                let newNode = Node()
                tempNode.map[ch] = newNode
                tempNode = newNode
            }
        }
        tempNode.isEnd = true
    }

    func find(_ word: String) -> String {
        var tempNode = rootNode
        var strArray = Array(word)

        var root = ""
        for ch in strArray {
            if let val = tempNode.map[ch] {
                tempNode = val
                root += String(ch)
                if tempNode.isEnd {
                    return root
                }
            } else {
                return word
            }
        }

        return word
    }
}


    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        var trie = Trie()

        for word in dictionary {
            trie.insert(word)
        }

        var wordArray = sentence.split(separator: " ")
        var ans = ""

        for word in wordArray {
            ans += trie.find(String(word))
            ans += " "
        }

        return String(ans.dropLast())
    }
}
