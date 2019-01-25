//
//  RemoveDeplicatesFromSortedArrayTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 1/24/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class RemoveDeplicatesFromSortedArrayTest: XCTestCase {

    func testRemoveDuplicatesFromSortedArray() {
        var expected = [2, 3, 5, 7, 11, 13]
        var actual = [2, 3, 5, 5, 7, 11, 11, 11, 13]
        actual.removeDuplicateElements()
        
        for i in 0..<expected.count {
            XCTAssertEqual(expected[i], actual[i])
        }
        
        expected = [2, 3, 5, 7, 12, 13, 14, 15, 16]
        actual = [2, 3, 3, 3, 5, 5, 7, 7, 7, 7, 12, 13, 14, 15, 16]
        actual.removeDuplicateElements()
        
        for i in 0..<expected.count {
            XCTAssertEqual(expected[i], actual[i])
        }
    }

}
