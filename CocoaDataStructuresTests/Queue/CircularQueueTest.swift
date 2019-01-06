//
//  CircularQueueTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 1/5/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class CircularQueueTest: XCTestCase {

    func testCircularQueue() {
        executeCircularQueueTest(with: 1)
        executeCircularQueueTest(with: 2)
    }
    
    func executeCircularQueueTest(with initialCapacity: UInt) {
        let queue = CircularQueue<Int>(capacity: initialCapacity)
        XCTAssertNil(queue.front())
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.dequeue())
        
        queue.enqueue(value: 1)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 1)
        queue.enqueue(value: 2)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 2)
        queue.enqueue(value: 3)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 3)
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.front(), 2)
        
        queue.enqueue(value: 4)
        XCTAssertEqual(queue.front(), 2)
        XCTAssertEqual(queue.count, 3)
        queue.enqueue(value: 5)
        XCTAssertEqual(queue.front(), 2)
        XCTAssertEqual(queue.count, 4)
        queue.enqueue(value: 6)
        XCTAssertEqual(queue.front(), 2)
        XCTAssertEqual(queue.count, 5)
        queue.enqueue(value: 7)
        XCTAssertEqual(queue.front(), 2)
        XCTAssertEqual(queue.count, 6)
        
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.count, 5)
        XCTAssertEqual(queue.front(), 3)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.count, 4)
        XCTAssertEqual(queue.front(), 4)
        XCTAssertEqual(queue.dequeue(), 4)
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.front(), 5)
        XCTAssertEqual(queue.dequeue(), 5)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.front(), 6)
        XCTAssertEqual(queue.dequeue(), 6)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front(), 7)
        XCTAssertEqual(queue.dequeue(), 7)
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.front())
        XCTAssertNil(queue.dequeue())
        
        queue.enqueue(value: 1)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 1)
        queue.enqueue(value: 2)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 2)
        queue.enqueue(value: 3)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 3)
        queue.enqueue(value: 4)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 4)
        queue.enqueue(value: 5)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 5)
        queue.enqueue(value: 6)
        XCTAssertEqual(queue.front(), 1)
        XCTAssertEqual(queue.count, 6)
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.front(), 2)
        XCTAssertEqual(queue.count, 5)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertEqual(queue.front(), 3)
        XCTAssertEqual(queue.count, 4)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.front(), 4)
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.dequeue(), 4)
        XCTAssertEqual(queue.front(), 5)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.dequeue(), 5)
        XCTAssertEqual(queue.front(), 6)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.dequeue(), 6)
        XCTAssertNil(queue.front())
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.dequeue())
    }
}
