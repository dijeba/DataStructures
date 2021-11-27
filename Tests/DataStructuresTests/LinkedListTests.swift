import XCTest
@testable import DataStructures

final class LinkedListTests: XCTestCase {
    
    private var sut: LinkedList<Int>!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        
        let nums = [1, 2, 3, 4]
        sut = nums.toLinkedList()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Variables
    
    func testIsEmpty() {
        
        let emptyLinkedList = LinkedList<Int>()
        XCTAssertTrue(emptyLinkedList.isEmpty)
        
        let notEmptyLinkedList = LinkedList<Int>()
        notEmptyLinkedList.append(1)
        
        XCTAssertFalse(notEmptyLinkedList.isEmpty)
    }
    
    func testCount() {
        
        let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let linkedList = nums.toLinkedList()
        
        XCTAssertEqual(linkedList.count, nums.count)
    }
    
    func testHead() {
        
        let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let linkedList = nums.toLinkedList()
        
        XCTAssertEqual(linkedList.head?.data, 1)
    }
    
    func testTail() {
        
        let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        let linkedList = nums.toLinkedList()
        
        XCTAssertEqual(linkedList.tail?.data, 10)
    }
    
    // MARK: - Read
    
    func testCreateArrayFromLinkedList() {
        
        let linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        
        let expectedSolution = [1, 2]
        
        XCTAssertEqual(linkedList.toArray(), expectedSolution)
    }
    
    func testNodeAt() {
        
        XCTAssertEqual(sut.nodeAt(0)?.data, 1)
        XCTAssertEqual(sut.nodeAt(1)?.data, 2)
        XCTAssertEqual(sut.nodeAt(2)?.data, 3)
        XCTAssertEqual(sut.nodeAt(3)?.data, 4)
    }
    
    // MARK: - Add
    
    func testAppend() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        
        sut.append(5)
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4, 5])
    }
    
    func testInsertAtIndexZero() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        
        sut.insertAt(0, data: 999)
        
        XCTAssertEqual(sut.head?.data, 999)
        XCTAssertEqual(sut.toArray(), [999, 1, 2, 3, 4])
    }
    
    func testInsertAtTheEnd() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        
        sut.insertAt(3, data: 999)
        
        XCTAssertEqual(sut.tail?.data, 999)
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4, 999])
        XCTAssertEqual(sut.tail?.previous?.data, 4)
    }
    
    func testInsertAtAnyIndex() {

        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])

        sut.insertAt(1, data: 25)
        XCTAssertEqual(sut.toArray(), [1, 25, 2, 3, 4])

        sut.insertAt(2, data: 50)
        XCTAssertEqual(sut.toArray(), [1, 25, 50, 2, 3, 4])

        sut.insertAt(4, data: 100)
        XCTAssertEqual(sut.toArray(), [1, 25, 50, 2, 100, 3, 4])
        
        sut.insertAt(3, data: 999)
        XCTAssertEqual(sut.toArray(), [1, 25, 50, 999, 2, 100, 3, 4])
        
        sut.insertAt(0, data: 777)
        XCTAssertEqual(sut.toArray(), [777, 1, 25, 50, 999, 2, 100, 3, 4])
        
        sut.insertAt(8, data: 288)
        XCTAssertEqual(sut.toArray(), [777, 1, 25, 50, 999, 2, 100, 3, 4, 288])
    }
    
    // MARK: - Remove
    
    func testRemoveAll() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        XCTAssertFalse(sut.isEmpty)
        
        sut.removeAll()
        
        XCTAssertEqual(sut.toArray(), [])
        XCTAssertTrue(sut.isEmpty)
    }
    
    func testRemoveNode() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        
        let node2 = sut.nodeAt(1)!
        XCTAssertEqual(node2.data, 2)
        
        sut.remove(node2)
        
        XCTAssertEqual(sut.toArray(), [1, 3, 4])
    }
    
    func testRemoveAt() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        sut.removeAt(1)
        
        XCTAssertEqual(sut.toArray(), [1, 3, 4])
    }
    
    // MARK: - Update
    
    func testUpdateNodeAtHead() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        
        sut.updateNodeAt(0, data: 999)
        
        XCTAssertEqual(sut.head?.data, 999)
        XCTAssertEqual(sut.toArray(), [999, 2, 3, 4])
    }
    
    func testUpdateNodeAtTail() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        
        sut.updateNodeAt(3, data: 999)
        
        XCTAssertEqual(sut.tail?.data, 999)
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 999])
    }
    
    func testUpdateNodeAt() {
        
        XCTAssertEqual(sut.toArray(), [1, 2, 3, 4])
        
        sut.updateNodeAt(1, data: 999)
        
        XCTAssertEqual(sut.toArray(), [1, 999, 3, 4])
    }
}
