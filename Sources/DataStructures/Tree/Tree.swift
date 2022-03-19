//
//  TreeNode.swift
//  
//
//  Created by Diego Jerez Barroso on 17/03/2022.
//

import Foundation

// MARK: - Tree Implementation

public class Tree<T: Equatable> {

    typealias Action = (_ data: T) -> Void

    private let action: Action
    private(set) var root: TreeNode<T>

    init(root: TreeNode<T>, action: Action? = nil) {

        self.root = root

        if let action = action {
            self.action = action
        } else {
            self.action = { print($0) }
        }
    }

    // MARK: - BFS:

    public func bfs() {
        bfs(root)
    }

    public func bfs(_ node: TreeNode<T>?) {
        guard let node = node else { return }

        let queue = Queue<TreeNode<T>>()
        queue.enqueue(node)

        while !queue.isEmpty {
            guard let node = queue.dequeue() else { return }

            action(node.data)

            if let leftNode = node.left {
                queue.enqueue(leftNode)
            }

            if let rightNode = node.right {
                queue.enqueue(rightNode)
            }
        }
    }

    // MARK: - DFS:
    // MARK: - Preorder Traversal

    public func preOrder() {
        preOrder(root)
    }

    public func preOrder(_ node: TreeNode<T>?) {
        guard let node = node else {
            return
        }

        action(node.data)
        preOrder(node.left)
        preOrder(node.right)
    }

    // MARK: - InOrder Traversal

    public func inOrder() {
        inOrder(root)
    }

    public func inOrder(_ node: TreeNode<T>?) {
        guard let node = node else {
            return
        }

        inOrder(node.left)
        action(node.data)
        inOrder(node.right)
    }

    // MARK: - PostOrder Traversal

    public func postOrder() {
        postOrder(root)
    }

    public func postOrder(_ node: TreeNode<T>?) {
        guard let node = node else {
            return
        }

        postOrder(node.left)
        postOrder(node.right)
        action(node.data)
    }
}
