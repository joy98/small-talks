//
//  79.swift
//  Small Talks
//
//  Created by Joy Sarkar on 25/10/24.
//

import Foundation

class Solution79 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let r = board.count, c = board[0].count
        var b = board

        for i in 0..<r {
            for j in 0..<c {
                if backtrack(&b,Array(word),i,j,0) {
                    return true
                }
            }
        }

        return false
    }

    func backtrack(_ board: inout [[Character]], _ word: [Character], _ i: Int, _ j: Int, _ index: Int) -> Bool {
        if index == word.count { return true}
        guard (i>=0) && (i<board.count) && (j>=0) && (j<board[0].count) && word[index] == board[i][j] else { return false }
        board[i][j] = "*"

        var rowOffsets = [0, 1, 0, -1]
        var colOffsets = [1, 0, -1, 0]
        var ans = false

        for k in 0..<4 {
            ans = ans || backtrack(&board,word,i + rowOffsets[k],j + colOffsets[k],index + 1)
            if ans { break }
        }

        board[i][j] = word[index]
        return ans
    }
}
