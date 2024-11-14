//
//  547.swift
//  Small Talks
//
//  Created by Joy Sarkar on 17/10/24.
//

import Foundation

class Solution547
{
    func findCircleNum(_ isConnected: [[Int]]) -> Int
    {
        let n = isConnected.count
        let cities: [Node<Int>] = (0..<n).map { Node($0) }
        for i in 0..<n {
        for j in (i+1)..<n where isConnected[i][j] == 1 {
            Node.union(cities[i], cities[j])
        }}
        return Set(cities.lazy.map { $0.findRoot().val }).count
    }
}

protocol UnionFind {
    func findRoot() -> Self
    static func union(_: Self, _: Self) -> Self
    func isInOneGroup(with: Self) -> Bool
}

final class Node<T>: UnionFind
{
    weak var parent: Node!
    var rank: Int = 0
    var val: T

    init(_ val: T) { self.val = val; parent = self }

    func isInOneGroup(with otherNode: Node) -> Bool {
        return self.findRoot() === otherNode.findRoot()
    }

    func findRoot() -> Node {
        if parent !== self { parent = parent.findRoot() }
        return parent
    }

    @discardableResult
    static func union(_ x: Node, _ y: Node) -> Node
    {
        let xRoot = x.findRoot(), yRoot = y.findRoot()
        if xRoot === yRoot { return xRoot }
        if xRoot.rank < yRoot.rank { xRoot.parent = yRoot; return yRoot }
        else if xRoot.rank > yRoot.rank { yRoot.parent = xRoot; return xRoot }
        else { yRoot.parent = xRoot; xRoot.rank += 1; return xRoot }
    }
}
