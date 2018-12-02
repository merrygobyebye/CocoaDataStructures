//
//  ReversePolishNotationEvaluatorTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 12/2/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class ReversePolishNotationEvaluatorTest: XCTestCase {

    func testReversePolishNotationEvaluator() {
        var stringRepresentation = "invalid"
        var evaluator = ReversePolishNotationEvaluator(stringRepresentation: stringRepresentation, separator: ",")
        XCTAssertThrowsError(try evaluator.evaluate())
        
        stringRepresentation = "3,4,5,*,-"
        evaluator = ReversePolishNotationEvaluator(stringRepresentation: stringRepresentation, separator: ",")
        XCTAssertEqual(try evaluator.evaluate(), -17)
    }

}
