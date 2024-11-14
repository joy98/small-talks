//
//  22.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

class Solution22 {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans: [String] = []
        calculate(2*n,0,0,&ans,"")
        return ans
    }

    func calculate(_ t: Int, _ l: Int, _ r: Int, _ ans: inout [String], _ curr: String) {
        if curr.count == t {
            ans.append(curr)
            return
        }

        if l < (t/2) {
            calculate(t,l+1,r,&ans,curr+"(")
        }

        if r < l && r < (t/2) {
            calculate(t,l,r+1,&ans,curr+")")
        }
        
    }
}
