//
//  210 .swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/09/24.
//

import Foundation

class Solution210 {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var arr: [Int: [Int]] = [:]
        var arr2 = Array(repeating: 0 , count: numCourses)

        for i in 0..<prerequisites.count {
            if let v = arr[prerequisites[i][1]] {
                arr[prerequisites[i][1]]?.append(prerequisites[i][0])
            } else {
                arr[prerequisites[i][1]] = [prerequisites[i][0]]
            }
            arr2[prerequisites[i][0]] += 1
        }

        var res: [Int] = []

        for i in 0..<numCourses {
            if arr2[i] == 0 {
                res.append(i)
            }
        }
        
        var temp = res
        var t2 = res

        while(true) {
            if temp.isEmpty {
                break
            }
            t2 = []
           
            for i in 0..<temp.count {
                for j in 0..<(arr[temp[i]]?.count ?? 0) {
                    arr2[arr[temp[i]]?[j] ?? 0] -= 1

                    if arr2[arr[temp[i]]?[j] ?? 0] == 0 {
                        t2.append(arr[temp[i]]?[j] ?? 0)
                        res.append(arr[temp[i]]?[j] ?? 0)
                    }
                }
            }
           
            temp = t2
        }

        for i in 0..<numCourses {
            if arr2[i] > 0 {
                return []
            }
        }

    return res
    }
}
