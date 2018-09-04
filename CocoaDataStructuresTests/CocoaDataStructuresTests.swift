//
//  CocoaDataStructuresTests.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 9/3/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class CocoaDataStructuresTests: XCTestCase {
    
    func testHeapPriorityQueue() {
        let pq = MinHeapPriorityQueue<Int>()
        pq.add(4)
        pq.add(6)
        pq.add(2)
        pq.add(3)
        pq.add(1)
        pq.add(5)
        
        let expected = [1, 2, 3, 4, 5, 6]
        let actual = [pq.removeMin(), pq.removeMin(), pq.removeMin(), pq.removeMin(), pq.removeMin(), pq.removeMin()]
        XCTAssertEqual(expected, actual)
    }
}
