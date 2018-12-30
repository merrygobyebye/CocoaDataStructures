//
//  ReversePolishNotationEvaluator.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 11/21/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import UIKit

enum ReversePolishNotationEvaluationError: Error {
    case InvalidSyntax
}

class ReversePolishNotationEvaluator {
    
    private(set) var stringRepresentation: String
    private(set) var separator: Character
    private var stack: ArrayStack<String> = ArrayStack()
    private var _result: Double?
    
    init(stringRepresentation: String, separator: Character) {
        self.stringRepresentation = stringRepresentation
        self.separator = separator
    }
    
    public func evaluate() throws -> Double {
        if let result = _result {
            return result
        }
        
        let components = stringRepresentation.split(separator: separator)
        try components.forEach { (component: Substring) in
            try evaluateNext(item: component)
        }
        
        if let resultStr = stack.pop(), let result = Double(resultStr) {
            _result = result
            return result
        }
        
        throw ReversePolishNotationEvaluationError.InvalidSyntax
    }
    
    private func evaluateNext(item: Substring) throws {
        if let op = Operator(rawValue: item) {
            guard let secondStr = stack.pop(),
                let second = Double(secondStr),
                let firstStr = stack.pop(),
                let first = Double(firstStr) else {
                throw ReversePolishNotationEvaluationError.InvalidSyntax
            }
            
            var result: Double
            switch op {
            case .addition:
                result = first + second
            case .division:
                result = first / second
            case .multiplication:
                result = first * second
            case .subtraction:
                result = first - second
            default:
                throw ReversePolishNotationEvaluationError.InvalidSyntax
            }
            
            stack.push(String(result))
        } else if let value = Double(item) {
            stack.push(String(value))
        } else {
            throw ReversePolishNotationEvaluationError.InvalidSyntax
        }
    }
}
