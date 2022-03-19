//
//  TreeNode.swift
//  
//
//  Created by Diego Jerez Barroso on 19/03/2022.
//

import Foundation

// MARK: - Node Implementation

public class TreeNode<T: Equatable> {

    public var data: T
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ data: T,
                left: TreeNode? = nil,
                right: TreeNode? = nil) {

        self.data = data
        self.left = left
        self.right = right
    }
}

extension TreeNode: Equatable {

    public static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
        lhs.data == rhs.data &&
        lhs.left?.data == rhs.left?.data &&
        lhs.right?.data == rhs.right?.data
    }
}
