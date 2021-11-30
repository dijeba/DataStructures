import XCTest
@testable import DataStructures

final class QueueTests: XCTestCase {
    
    private var sut: Queue<Int>!
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        
        sut = Queue<Int>()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Variables
    
    func testIsEmpty() {
        XCTAssertTrue(sut.isEmpty)
    }
    
    func testIsNotEmpty() {
        
        XCTAssertTrue(sut.isEmpty)
        
        sut.enqueue(1)
        
        XCTAssertFalse(sut.isEmpty)
    }
    
    // MARK: - Public methods
    
    func testEnqueue() {
        
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        XCTAssertEqual(sut.dequeue(), 1)
        XCTAssertEqual(sut.dequeue(), 2)
        XCTAssertEqual(sut.dequeue(), 3)
    }
    
    func testDequeue() {
        
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        XCTAssertFalse(sut.isEmpty)
        
        _ = sut.dequeue()
        _ = sut.dequeue()
        _ = sut.dequeue()
        
        XCTAssertTrue(sut.isEmpty)
    }
    
    func testPeek() {
        
        XCTAssertNil(sut.peek())
        
        sut.enqueue(1)
        XCTAssertEqual(sut.peek(), 1)
        
        sut.enqueue(2)
        XCTAssertEqual(sut.peek(), 1)
        
        sut.enqueue(3)
        XCTAssertEqual(sut.peek(), 1)
        
        XCTAssertEqual(sut.dequeue(), 1)
        XCTAssertEqual(sut.peek(), 2)
        
        XCTAssertEqual(sut.dequeue(), 2)
        XCTAssertEqual(sut.peek(), 3)
        
        XCTAssertEqual(sut.dequeue(), 3)
        
        XCTAssertNil(sut.peek())
    }
}
