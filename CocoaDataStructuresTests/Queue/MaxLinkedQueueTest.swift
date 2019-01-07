//
//  MaxLinkedQueueTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 1/6/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class MaxLinkedQueueTest: XCTestCase {

    func testMaxLinkedQueue() {
        let queue = MaxLinkedQueue<Int>()
        queue.enqueue(value: 1)
        XCTAssertEqual(queue.max, 1)
        queue.enqueue(value: 3)
        XCTAssertEqual(queue.max, 3)
        queue.enqueue(value: 4)
        XCTAssertEqual(queue.max, 4)
        queue.enqueue(value: 100)
        XCTAssertEqual(queue.max, 100)
        queue.enqueue(value: 98)
        XCTAssertEqual(queue.max, 100)
        queue.enqueue(value: 99)
        XCTAssertEqual(queue.max, 100)
        queue.enqueue(value: 1)
        XCTAssertEqual(queue.max, 100)
        queue.enqueue(value: 1)
        XCTAssertEqual(queue.max, 100)
        queue.enqueue(value: 3)
        XCTAssertEqual(queue.max, 100)
        queue.enqueue(value: 2)
        XCTAssertEqual(queue.max, 100)
        
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.max, 100)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.max, 100)
        XCTAssertEqual(queue.dequeue(), 4)
        XCTAssertEqual(queue.max, 100)
        XCTAssertEqual(queue.dequeue(), 100)
        XCTAssertEqual(queue.max, 99)
        XCTAssertEqual(queue.dequeue(), 98)
        XCTAssertEqual(queue.max, 99)
        XCTAssertEqual(queue.dequeue(), 99)
        XCTAssertEqual(queue.max, 3)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.max, 3)
        XCTAssertEqual(queue.dequeue(), 1)
        XCTAssertEqual(queue.max, 3)
        XCTAssertEqual(queue.dequeue(), 3)
        XCTAssertEqual(queue.max, 2)
        XCTAssertEqual(queue.dequeue(), 2)
        XCTAssertNil(queue.max)
    }
}
