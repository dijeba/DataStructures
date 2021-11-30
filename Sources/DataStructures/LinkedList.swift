//
//  LinkedList.swift
//  
//
//  Created by Diego Jerez Barroso on 21/11/2021.
//

import Foundation

// MARK: - Doubly Linked List Implementation

public class LinkedList<T: Equatable> {
    
    // MARK: - Private Variables
    
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    
    // MARK: - Public Variables
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public var count: Int {
        
        guard head != nil else {
            return 0
        }
        
        var result = 0
        var current = head
        
        while current != nil {
            result += 1
            current = current?.next
        }
        
        return result
    }
    
    // MARK: - Read
    
    public func printAll() {
        
        var current = head
        
        while current != nil {
            print(current!.data)
            current = current?.next
        }
    }
    
    public func toArray() -> [T] {
        
        var result: [T?] = []
        var current = head
        
        while current != nil {
            result.append(current?.data)
            current = current?.next
        }
        
        return result.compactMap { $0 }
    }
    
    // TODO: Change with `subscript`
    public func nodeAt(_ index: Int) -> Node<T>? {
        
        guard index >= 0 else {
            assertionFailure("index cannot be negative!")
            return nil
        }
        
        guard index <= count else {
            assertionFailure("index out of bounds")
            return nil
        }
        
        var current = head
        var currentIndex = 0
        
        while current != nil {
            
            if currentIndex == index {
                return current
            }
            
            currentIndex += 1
            current = current?.next
        }
        
        return nil
    }
    
    // MARK: - Add
    
    public func append(_ data: T) {
        
        let newNode = Node(data)
        
        if let tail = tail {
            newNode.previous = tail
            tail.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    @discardableResult
    public func insertAt(_ index: Int, data: T) -> Node<T> {
        
        // If inserted at 0:
        
        if index == 0 {
            let newNode = Node(data)
            newNode.next = head
            head?.previous = newNode
            head = newNode
            return newNode
        }
        
        // If inserted at the end:
        
        if index == (count - 1) {
            let newNode = Node(data)
            newNode.previous = tail
            append(data)
            return newNode
        }
        
        // If inserted at index 1, head must point to our node:
        
        if index == 1 {
            let newNode = Node(data)
            newNode.next = head?.next
            newNode.previous = head
            head?.next = newNode
            newNode.next?.previous = newNode
            return newNode
        }
        
        // If inserted at any other index:
        
        let newNode = Node(data)
        var current = head
        var currentIndex = 0
        
        while current != nil {
            
            if currentIndex == index {
                newNode.previous = current?.previous
                newNode.next = current
                
                current?.previous?.next = newNode
                current?.previous = newNode
                
                return newNode
            }
            
            currentIndex += 1
            current = current?.next
        }
        
        return newNode
    }
    
    // MARK: - Remove
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    @discardableResult
    public func remove(_ nodeToRemove: Node<T>) -> T {
        
        if nodeToRemove.previous == nil {
            head = nodeToRemove.next
        } else {
            nodeToRemove.previous?.next = nodeToRemove.next
        }
        
        nodeToRemove.next?.previous = nodeToRemove.previous
        
        if nodeToRemove.next == nil {
            tail = nodeToRemove.previous
        }
        
        nodeToRemove.previous = nil
        nodeToRemove.next = nil
        
        return nodeToRemove.data
    }
    
    @discardableResult
    public func removeAt(_ index: Int) -> T? {
        
        guard let nodeToRemove = nodeAt(index) else {
            assertionFailure("Node was not found")
            return nil
        }
        
        remove(nodeToRemove)
        
        return nodeToRemove.data
    }
    
    // MARK: - Update
    
    @discardableResult
    public func updateNodeAt(_ index: Int, data: T) -> Node<T> {
        
        guard let node = nodeAt(index) else {
            assertionFailure("Node was not found")
            return Node(data)
        }
        
        node.data = data
        
        return node
    }
}

// MARK: - Print

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        
        var result = "["
        
        var current = head
        
        while current != nil {
            result += "\(current!.data)"
            current = current?.next
            
            if current != nil {
                result += ", "
            }
        }
        
        result += "]"
        
        return result
    }
}

// MARK: - Node Implementation

extension LinkedList {
    
    public class Node<T> {
        
        var data: T
        var next: Node?
        /// It is `weak` because if `A.next` points to `B` and `B.previous` points to `A`, there's a reference cycle
        weak var previous: Node?
        
        init(_ data: T,
             next: Node? = nil,
             previous: Node? = nil) {
            
            self.data = data
            self.next = next
            self.previous = previous
        }
    }
}

// MARK: - Convenience methods

public extension Collection where Element: Equatable {
    
    func toLinkedList() -> LinkedList<Element> {
        
        guard !self.isEmpty else {
            return LinkedList()
        }
        
        let linkedList = LinkedList<Element>()
        
        self.forEach { linkedList.append($0) }
        
        return linkedList
    }
}
