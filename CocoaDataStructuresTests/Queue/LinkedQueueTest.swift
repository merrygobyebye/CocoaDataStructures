//
//  LinkedQueueTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 1/3/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class LinkedQueueTest: XCTestCase {

    func testLinkedQueue() {
        let queue = LinkedQueue<String>()
        
        var first = "first"
        var second = "second"
        var third = "third"
        
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.front())
        
        queue.enqueue(value: first)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front(), first)
        queue.enqueue(value: second)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.front(), first)
        queue.enqueue(value: third)
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.front(), first)
        
        XCTAssertEqual(queue.dequeue(), first)
        XCTAssertEqual(queue.dequeue(), second)
        XCTAssertEqual(queue.dequeue(), third)
        
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.front())
        
        first = "fourth"
        second = "fifth"
        third = "sixth"
        
        queue.enqueue(value: first)
        XCTAssertEqual(queue.count, 1)
        XCTAssertEqual(queue.front(), first)
        queue.enqueue(value: second)
        XCTAssertEqual(queue.count, 2)
        XCTAssertEqual(queue.front(), first)
        queue.enqueue(value: third)
        XCTAssertEqual(queue.count, 3)
        XCTAssertEqual(queue.front(), first)
        
        XCTAssertEqual(queue.dequeue(), first)
        XCTAssertEqual(queue.dequeue(), second)
        XCTAssertEqual(queue.dequeue(), third)

        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.front())
    }

}
