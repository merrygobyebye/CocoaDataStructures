//
//  LinkedQueueTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 12/28/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class LinkedDequeTest: XCTestCase {

    func testLinkedDeque() {
        var foo1: Foo? = Foo(bar: "baz1")
        var foo2: Foo? = Foo(bar: "baz2")
        var foo3: Foo? = Foo(bar: "baz3")
        
        let deque = LinkedDeque<Foo>()
        XCTAssertNil(deque.front())
        XCTAssertNil(deque.back())
        XCTAssertEqual(deque.count, 0)
        deque.pushToBack(value: foo1!)
        XCTAssertEqual(deque.front()?.bar, "baz1")
        XCTAssertEqual(deque.back()?.bar, "baz1")
        XCTAssertEqual(deque.count, 1)
        deque.pushToBack(value: foo2!)
        XCTAssertEqual(deque.front()?.bar, "baz1")
        XCTAssertEqual(deque.back()?.bar, "baz2")
        XCTAssertEqual(deque.count, 2)
        deque.pushToBack(value: foo3!)
        XCTAssertEqual(deque.front()?.bar, "baz1")
        XCTAssertEqual(deque.back()?.bar, "baz3")
        XCTAssertEqual(deque.count, 3)
        
        XCTAssertEqual(deque.popFromFront()?.bar, "baz1")
        XCTAssertEqual(deque.front()?.bar, "baz2")
        XCTAssertEqual(deque.back()?.bar, "baz3")
        XCTAssertEqual(deque.count, 2)
        XCTAssertEqual(deque.popFromBack()?.bar, "baz3")
        XCTAssertEqual(deque.front()?.bar, "baz2")
        XCTAssertEqual(deque.back()?.bar, "baz2")
        XCTAssertEqual(deque.count, 1)
        XCTAssertEqual(deque.popFromBack()?.bar, "baz2")
        XCTAssertNil(deque.front())
        XCTAssertNil(deque.back())
        XCTAssertEqual(deque.count, 0)
        
        foo1 = Foo(bar: "baz4")
        foo2 = Foo(bar: "baz5")
        foo3 = Foo(bar: "baz6")
        
        XCTAssertNil(deque.front())
        XCTAssertNil(deque.back())
        XCTAssertEqual(deque.count, 0)
        deque.pushToBack(value: foo1!)
        XCTAssertEqual(deque.front()?.bar, "baz4")
        XCTAssertEqual(deque.back()?.bar, "baz4")
        XCTAssertEqual(deque.count, 1)
        deque.pushToFront(value: foo2!)
        XCTAssertEqual(deque.front()?.bar, "baz5")
        XCTAssertEqual(deque.back()?.bar, "baz4")
        XCTAssertEqual(deque.count, 2)
        deque.pushToBack(value: foo3!)
        XCTAssertEqual(deque.front()?.bar, "baz5")
        XCTAssertEqual(deque.back()?.bar, "baz6")
        XCTAssertEqual(deque.count, 3)
        
        XCTAssertEqual(deque.popFromFront()?.bar, "baz5")
        XCTAssertEqual(deque.front()?.bar, "baz4")
        XCTAssertEqual(deque.back()?.bar, "baz6")
        XCTAssertEqual(deque.count, 2)
        XCTAssertEqual(deque.popFromBack()?.bar, "baz6")
        XCTAssertEqual(deque.front()?.bar, "baz4")
        XCTAssertEqual(deque.back()?.bar, "baz4")
        XCTAssertEqual(deque.count, 1)
        XCTAssertEqual(deque.popFromBack()?.bar, "baz4")
        XCTAssertNil(deque.front())
        XCTAssertNil(deque.back())
        XCTAssertEqual(deque.count, 0)
    }
}

class Foo {
    let bar: String
    
    init(bar: String) {
        self.bar = bar
    }
}
