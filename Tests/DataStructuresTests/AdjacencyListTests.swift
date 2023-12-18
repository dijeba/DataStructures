//
//  AdjacencyListTests.swift
//  
//
//  Created by Diego Jerez Barroso on 18/12/2023.
//

import XCTest
@testable import DataStructures

final class AdjacencyListTests: XCTestCase {

    private var sut: AdjacencyList<String>!

    override func setUp() {
        super.setUp()

        sut = .init()
    }

    func test_edges_directed() {
        /*
         //////////////
             A -> B -> D
             |
             v
             C
         //////////////
         */

        let A = Vertex(data: "A")
        let B = Vertex(data: "B")
        let C = Vertex(data: "C")
        let D = Vertex(data: "D")

        sut.add(vertex: A)
        sut.add(vertex: B)
        sut.add(vertex: C)
        sut.add(vertex: D)

        sut.add(.directed, from: A, to: B)
        sut.add(.directed, from: A, to: C)
        sut.add(.directed, from: B, to: D)

        // A - B and A - C
        let edges1 = sut.edges(from: A)

        XCTAssertEqual(edges1?.count, 2)
        
        XCTAssertEqual(edges1?[0].source, A)
        XCTAssertEqual(edges1?[0].destination, B)

        XCTAssertEqual(edges1?[1].source, A)
        XCTAssertEqual(edges1?[1].destination, C)

        // B - D
        let edges2 = sut.edges(from: B)

        XCTAssertEqual(edges2?[0].source, B)
        XCTAssertEqual(edges2?[0].destination, D)
    }

    func test_edges_undirected() {
        /*
         //////////////
             A = B
             || ||
             D = C
         //////////////
         */
        let A = Vertex(data: "A")
        let B = Vertex(data: "B")
        let C = Vertex(data: "C")
        let D = Vertex(data: "D")

        sut.add(vertex: A)
        sut.add(vertex: B)
        sut.add(vertex: C)
        sut.add(vertex: D)

        sut.add(.undirected, from: A, to: B)
        sut.add(.undirected, from: B, to: C)
        sut.add(.undirected, from: C, to: D)
        sut.add(.undirected, from: D, to: A)

        // A-B & A-D
        let fromA = sut.edges(from: A)

        XCTAssertEqual(fromA?.count, 2)

        XCTAssertEqual(fromA?[0].source, A)
        XCTAssertEqual(fromA?[0].destination, B)

        XCTAssertEqual(fromA?[1].source, A)
        XCTAssertEqual(fromA?[1].destination, D)

        // B-A & B-C
        let fromB = sut.edges(from: B)

        XCTAssertEqual(fromB?[0].source, B)
        XCTAssertEqual(fromB?[0].destination, A)

        XCTAssertEqual(fromB?[1].source, B)
        XCTAssertEqual(fromB?[1].destination, C)

        // C-B & C-D
        let fromC = sut.edges(from: C)

        XCTAssertEqual(fromC?[0].source, C)
        XCTAssertEqual(fromC?[0].destination, B)

        XCTAssertEqual(fromC?[1].source, C)
        XCTAssertEqual(fromC?[1].destination, D)

        // D-C & D-A
        let fromD = sut.edges(from: D)

        XCTAssertEqual(fromD?[0].source, D)
        XCTAssertEqual(fromD?[0].destination, C)

        XCTAssertEqual(fromD?[1].source, D)
        XCTAssertEqual(fromD?[1].destination, A)
    }

    func test_weights() {
        /*
         ////////////////////////////

                      E (w: 12)
                      ^
                      |
           (w:1) D <- A -> B (w: 4)
                      |
                      v
                      C (w: 9)

         ////////////////////////////
         */

        let A = Vertex(data: "A")
        let B = Vertex(data: "B")
        let C = Vertex(data: "C")
        let D = Vertex(data: "D")
        let E = Vertex(data: "E")

        sut.add(vertex: A)
        sut.add(vertex: B)
        sut.add(vertex: C)
        sut.add(vertex: D)
        sut.add(vertex: E)

        sut.add(.directed, from: A, to: B, weight: 4)
        sut.add(.directed, from: A, to: C, weight: 9)
        sut.add(.directed, from: A, to: D, weight: 1)
        sut.add(.directed, from: A, to: E, weight: 12)

        XCTAssertEqual(sut.weight(from: A, to: B), 4)
        XCTAssertEqual(sut.weight(from: A, to: C), 9)
        XCTAssertEqual(sut.weight(from: A, to: D), 1)
        XCTAssertEqual(sut.weight(from: A, to: E), 12)
    }
}
