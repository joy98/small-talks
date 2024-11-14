//
//  787_BMF.swift
//  Small Talks
//
//  Created by Joy Sarkar on 21/10/24.
//

import Foundation

class Solution787_BMF {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var ans = Array(repeating: Int.max, count: n)
        ans[src] = 0 //cost to reach src is 0

        //we need atmost k stops, finding min cost to reach a vertex , if it has 1 edge, then 2 edge, 3 edge and so on
        
        for i in  0...k {
            var temp = ans

            for flight in flights {
                let (s, d, p) = (flight[0], flight[1], flight[2])

                if ans[s] != Int.max && temp[d] > ans[s] + p {
                    //price to reach d is now lower
                    temp[d] = ans[s] + p
                }
            }
            ans = temp
        }

        return ans[dst] == Int.max ? -1 : ans[dst]
    }
}
