//
//  Heap.swift
//
//
//  Created by Diego Jerez Barroso on 19/12/2023.
//

import Foundation

public class Heap<T> {

    private var elements: [T]
    private let priorityFunction: (T, T) -> Bool

    public init(elements: [T] = [], priorityFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction

        buildHeap()
    }

    // MARK: - Public

    public var isEmpty: Bool {
        elements.isEmpty
    }

    public var count: Int {
        elements.count
    }

    public func peek() -> T? {
        elements.first
    }

    public func isRoot(_ index: Int) -> Bool {
        index == 0
    }

    public func enqueue(_ element: T) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1) // -1 is the highest legal index value in the `elements` array
    }

    public func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }

        swapElement(at: 0, with: count - 1)

        let element = elements.removeLast()

        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }

        return element
    }

    // MARK: - Helper functions

    private func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }

    private func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)

        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }

        swapElement(at: index, with: parent)

        siftUp(elementAtIndex: parent)
    }

    private func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)

        if index == childIndex {
            return
        }

        swapElement(at: index, with: childIndex)

        siftDown(elementAtIndex: childIndex)
    }

    private func leftChildIndex(of index: Int) -> Int {
        (2 * index) + 1 // 2i + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        (2 * index) + 2 // 2i + 2
    }

    private func parentIndex(of index: Int) -> Int {
        (index - 1) / 2
    }

    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }

    private func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }

        return childIndex
    }

    private func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }

    private func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return
        }

        swap(&elements[firstIndex], &elements[secondIndex])
    }
}
