//
//  124.swift
//  Small Talks
//
//  Created by Joy Sarkar on 11/09/24.
//

import Foundation


// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution124 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var m = root?.val ?? 0
        find(root,&m)
        return m
    }
    
    @discardableResult
    func find(_ root: TreeNode?, _ m: inout Int) -> Int {
        if root == nil { return 0 }
        
        var c = root?.val ?? 0
        var l = find(root?.left,&m)
        var r = find(root?.right,&m)
        
        var curMax = max((c+l),(c+r),c)
        m = max(m,(c+l+r),curMax)
        return curMax
    }
}
