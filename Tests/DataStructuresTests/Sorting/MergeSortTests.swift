//
//  MergeSortTests.swift
//  
//
//  Created by Diego Jerez Barroso on 21/03/2022.
//

import XCTest
@testable import DataStructures

class MergeSortTests: XCTestCase {

    func test1() {
        var array = [7, 3, 9, 5, 4, 8, 0, 1]
        let expectedAnswer = [0, 1, 3, 4, 5, 7, 8, 9]

        XCTAssertEqual(array.mergeSort(), expectedAnswer)
    }

    func test2() {
        var array = [9, 8, 7, 6, 5, 4, 3, 2, 1]
        let expectedAnswer = [1, 2, 3, 4, 5, 6, 7, 8, 9]

        XCTAssertEqual(array.mergeSort(), expectedAnswer)
    }

    func test3() {
        var array = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
        let expectedAnswer = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

        XCTAssertEqual(array.mergeSort(), expectedAnswer)
    }

    func test4() {
        var array = [0, -90, 1010, 47, 2, -100]
        let expectedAnswer = [-100, -90, 0, 2, 47, 1010]

        XCTAssertEqual(array.mergeSort(), expectedAnswer)
    }
}
