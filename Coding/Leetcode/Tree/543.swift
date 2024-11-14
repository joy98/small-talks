//
//  543.swift
//  Small Talks
//
//  Created by Joy Sarkar on 11/09/24.
//

import Foundation

class Solution {
    private var m = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = find(root)
        return m - 1
    }

    func find(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        var l = find(root.left)
        var r = find(root.right)

        var curMax = 1 + max(l,r)

        m = max(m, curMax, 1 + l + r)

        return curMax
    }
}
