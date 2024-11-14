//
//  38.swift
//  Small Talks
//
//  Created by Joy Sarkar on 23/10/24.
//

import Foundation

class Solution38 {
    func countAndSay(_ n: Int) -> String {
        var ans: [Int] = [1]

        var t = n-1
        while(t>0) {
            t -= 1
            var prev: Int = ans[0]
            var temp: [Int] = []
            var c = 1

            for i in 1..<ans.count {
                if ans[i] != prev {
                    temp.append(c)
                    temp.append(prev)
                    prev = ans[i]
                    c = 1
                } else {
                    c+=1
                }
            }
            temp.append(c)
            temp.append(prev)
            ans = temp
        }

        var a = ""

        for i in ans {
            a += String(i)
        }

        return a
    }
}
