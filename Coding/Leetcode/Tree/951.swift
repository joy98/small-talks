//
//  951.swift
//  Small Talks
//
//  Created by Joy Sarkar on 11/09/24.
//

import Foundation

class Solution951 {
    func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        if root1 == nil && root2 == nil { return true }

        guard let root1, let root2 else { return false }

        if root1.val != root2.val  { return false}

        return (flipEquiv(root1.left, root2.left) && flipEquiv(root1.right, root2.right) ||
                flipEquiv(root1.left, root2.right) && flipEquiv(root1.right, root2.left))
    }
}
