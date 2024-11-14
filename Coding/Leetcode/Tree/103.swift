//
//  103.swift
//  Small Talks
//
//  Created by Joy Sarkar on 24/10/24.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution103 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans: [[Int]] = []
        traverse(root, &ans, 0)
        return ans
    }

    func traverse(_ root: TreeNode?, _ ans: inout [[Int]], _ level: Int) {
        guard let root else { return }

        if ans.count >= (level + 1) {
            if (level%2==0) {
                ans[level].append(root.val)
            } else {
                ans[level] = [root.val] + ans[level]
            }
        } else {
            ans.append([root.val])
        }
        traverse(root.left,&ans,level+1)
        traverse(root.right,&ans,level+1)
    }
}
