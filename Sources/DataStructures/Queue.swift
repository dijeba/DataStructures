//
//  Queue.swift
//  
//
//  Created by Diego Jerez Barroso on 30/11/2021.
//

import Foundation

// MARK: - Queue implementation (with a LinkedList)

public class Queue<T: Equatable> {
    
    // MARK: - Private Variables
    
    private var list = LinkedList<T>()
    
    // MARK: - Public Variables
    
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    // MARK: - Public
    
    public func enqueue(_ data: T) {
        list.append(data)
    }
    
    public func dequeue() -> T? {
        
        guard !list.isEmpty, let node = list.head else {
            return nil
        }
        
        list.removeAt(0)
        return node.data
    }
    
    public func peek() -> T? {
        list.head?.data
    }
}

// MARK: - Print

extension Queue: CustomStringConvertible {
    
    public var description: String {
        list.description
    }
    
    public func printAll() {
        list.printAll()
    }
}
