//
//  WellFormedParenthesesEvaluatorTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 12/2/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class WellFormedParenthesesEvaluatorTest: XCTestCase {

    func testWellFormedParenthesesEvaluatorTest() {
        var stringRepresentation = "123"
        var evaluator = WellFormedParenthesesEvaluator(stringRepresentation: stringRepresentation)
        XCTAssertThrowsError(try evaluator.evaluate())

        stringRepresentation = "()"
        evaluator = WellFormedParenthesesEvaluator(stringRepresentation: stringRepresentation)
        XCTAssertTrue(try evaluator.evaluate())

        stringRepresentation = "([]){()}"
        evaluator = WellFormedParenthesesEvaluator(stringRepresentation: stringRepresentation)
        XCTAssertTrue(try evaluator.evaluate())

        stringRepresentation = "[()[]{()()}]"
        evaluator = WellFormedParenthesesEvaluator(stringRepresentation: stringRepresentation)
        XCTAssertTrue(try evaluator.evaluate())
        
        stringRepresentation = "{)"
        evaluator = WellFormedParenthesesEvaluator(stringRepresentation: stringRepresentation)
        XCTAssertFalse(try evaluator.evaluate())
        
        stringRepresentation = "[()[]{()()"
        evaluator = WellFormedParenthesesEvaluator(stringRepresentation: stringRepresentation)
        XCTAssertFalse(try evaluator.evaluate())
    }

}
