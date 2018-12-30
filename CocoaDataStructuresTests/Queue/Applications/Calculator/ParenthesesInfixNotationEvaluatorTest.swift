//
//  ParenthesesInfixNotationEvaluatorTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 12/30/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class ParenthesesInfixNotationEvaluatorTest: XCTestCase {

    func testEvaluateThrowsError() {
        var evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2*5*10*")
        XCTAssertThrowsError(try evaluator.evaluate())
        
        evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "foo")
        XCTAssertThrowsError(try evaluator.evaluate())
        
        evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2*(5+1)*8*(")
        XCTAssertThrowsError(try evaluator.evaluate())
        
        evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2*(5+1*8*")
        XCTAssertThrowsError(try evaluator.evaluate())
        
        evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2*(5+1*(4+8)*(8-3)*8")
        XCTAssertThrowsError(try evaluator.evaluate())
        
        evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2*5*10")
        XCTAssertNoThrow(try evaluator.evaluate())
        
        evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2.5*4*10")
        XCTAssertNoThrow(try evaluator.evaluate())
        
        evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2*((5+1)*((4+8)-(8-3)))*8")
        XCTAssertNoThrow(try evaluator.evaluate())
    }
    
    func testEvaluateWithoutOrderOfOperations() {
        var evaluator = InfixNotationEvaluator(stringRepresentation: "2*5*10")
        XCTAssertEqual(100, try evaluator.evaluate())
        
        evaluator = InfixNotationEvaluator(stringRepresentation: "100/2.5/4")
        XCTAssertEqual(10, try evaluator.evaluate())
    }
    
    func testEvaluateWithOrderOfOperations() {
        var evaluator = InfixNotationEvaluator(stringRepresentation: "2+5*10")
        XCTAssertEqual(52, try evaluator.evaluate())
        
        evaluator = InfixNotationEvaluator(stringRepresentation: "100-5/2")
        XCTAssertEqual(97.5, try evaluator.evaluate())
    }
    
    func testEvaluateWithOrderOfOperationsAndParentheses() {
        let evaluator = ParenthesesInfixNotationEvaluator(stringRepresentation: "2*((3+5*2)*((4+8)-(8-3)))*8")
        XCTAssertEqual(1456, try evaluator.evaluate())
    }
}
