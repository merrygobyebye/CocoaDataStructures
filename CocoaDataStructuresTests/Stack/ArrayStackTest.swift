//
//  ArrayStackTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 12/2/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class ArrayStackTest: XCTestCase {

    func testArrayStack() {
        let stack = ArrayStack<Int>()
        XCTAssertNil(stack.peek())
        XCTAssertNil(stack.pop())
        XCTAssertEqual(stack.count(), 0)
        
        stack.push(1)
        XCTAssertEqual(stack.max(), 1)
        XCTAssertEqual(stack.count(), 1)
        stack.push(2)
        XCTAssertEqual(stack.max(), 2)
        XCTAssertEqual(stack.count(), 2)
        stack.push(2)
        XCTAssertEqual(stack.max(), 2)
        XCTAssertEqual(stack.count(), 3)
        stack.push(4)
        XCTAssertEqual(stack.max(), 4)
        XCTAssertEqual(stack.count(), 4)
        stack.push(3)
        XCTAssertEqual(stack.max(), 4)
        XCTAssertEqual(stack.count(), 5)
        
        XCTAssertEqual(stack.peek(), 3)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.count(), 4)
        XCTAssertEqual(stack.peek(), 4)
        XCTAssertEqual(stack.pop(), 4)
        XCTAssertEqual(stack.count(), 3)
        XCTAssertEqual(stack.peek(), 2)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.count(), 2)
        XCTAssertEqual(stack.peek(), 2)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.count(), 1)
        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertEqual(stack.count(), 0)
        
        XCTAssertNil(stack.peek())
        XCTAssertNil(stack.pop())
    }

}
