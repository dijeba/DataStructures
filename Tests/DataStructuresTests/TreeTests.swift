//
//  TreeTests.swift
//  
//
//  Created by Diego Jerez Barroso on 19/03/2022.
//

import XCTest
@testable import DataStructures

class TreeTests: XCTestCase {

    typealias Node = TreeNode<String>

    private var sut: Tree<String>!
    private var output: [String] = []
    private var dict: [String: Node] = [:]

    override func setUp() {
        super.setUp()
        sut = makeTree()
    }

    override func tearDown() {
        sut = nil
        output.removeAll()
        dict.removeAll()

        super.tearDown()
    }

    // MARK: - BFS tests

    func testBfs() {
        let expectedOutput = [
            "F", "B", "G", "A", "D", "I", "C", "E", "H"
        ]

        sut.bfs()

        XCTAssertEqual(output, expectedOutput)
    }

    func testBfs_from_specific_node() {
        let expectedOutput = [
            "B", "A", "D", "C", "E"
        ]

        let startingNode = dict["B"]!
        sut.bfs(startingNode)

        XCTAssertEqual(output, expectedOutput)
    }

    // MARK: - DFS:
    // MARK: - PreOrder tests

    func testPreOrder() {
        let expectedOutput = [
            "F", "B", "A", "D", "C", "E", "G", "I", "H"
        ]

        sut.preOrder()

        XCTAssertEqual(output, expectedOutput)
    }

    func testPreOrder_from_specific_node() {
        let expectedOutput = [
            "D", "C", "E"
        ]

        let startingNode = dict["D"]!
        sut.preOrder(startingNode)

        XCTAssertEqual(output, expectedOutput)
    }

    // MARK: - InOrder tests

    func testInOrder() {

        let expectedOutput = [
            "A", "B", "C", "D", "E", "F", "G", "H", "I"
        ]

        sut.inOrder()

        XCTAssertEqual(output, expectedOutput)
    }

    func testInOrder_from_specific_node() {
        let expectedOutput = [
            "C", "D", "E"
        ]

        let startingNode = dict["D"]!
        sut.inOrder(startingNode)

        XCTAssertEqual(output, expectedOutput)
    }

    // MARK: - PostOrder tests

    func testPostOrder() {

        let expectedOutput = [
            "A", "C", "E", "D", "B", "H", "I", "G", "F"
        ]

        sut.postOrder()

        XCTAssertEqual(output, expectedOutput)
    }

    func testPostOrder_from_specific_node() {
        let expectedOutput = [
            "C", "E", "D"
        ]

        let startingNode = dict["D"]!
        sut.postOrder(startingNode)

        XCTAssertEqual(output, expectedOutput)
    }
}

extension TreeTests {

    private func makeTree() -> Tree<String> {
        let nodeF = Node("F")
        dict["F"] = nodeF

        let nodeB = Node("B")
        dict["B"] = nodeB

        let nodeG = Node("G")
        dict["G"] = nodeG

        let nodeA = Node("A")
        dict["A"] = nodeA

        let nodeD = Node("D")
        dict["D"] = nodeD

        let nodeI = Node("I")
        dict["I"] = nodeI

        let nodeC = Node("C")
        dict["C"] = nodeC

        let nodeE = Node("E")
        dict["E"] = nodeE

        let nodeH = Node("H")
        dict["H"] = nodeH

        nodeD.left = nodeC
        nodeD.right = nodeE

        nodeI.left = nodeH

        nodeB.left = nodeA
        nodeB.right = nodeD

        nodeG.right = nodeI

        nodeF.left = nodeB
        nodeF.right = nodeG

        return .init(root: nodeF) { [weak self] in
            self?.output.append($0)
        }
    }
}
