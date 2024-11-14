//
//  94.swift
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
class Solution94 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else { return []}
        var ans: [Int] = []
        ans += inorderTraversal(root.left)
        ans.append(root.val)
        ans += inorderTraversal(root.right)
        return ans
    }
}
