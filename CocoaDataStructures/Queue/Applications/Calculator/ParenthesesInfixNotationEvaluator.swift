//
//  ParenthesesInfixNotationEvaluator.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 12/30/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import Foundation

class ParenthesesInfixNotationEvaluator: InfixNotationEvaluator {
    
    override func evaluate() throws -> Double {
        let elements = try parse(stringRepresentation: stringRepresentation)
        if let op = Operator(rawValue: Substring(elements.back()!)), op != .closeParenthesis {
            throw InfixNotationEvaluatorError.InvalidSyntax
        }
        
        return try evaluateExpression(composedOf: elements)
    }
    
    override func evaluateExpression(composedOf elements: LinkedDeque<String>) throws -> Double {
        if elements.count == 1 {
            return Double(elements.popFromFront()!)!
        } else {
            let token = elements.popFromFront()
            if let op = Operator(rawValue: Substring(token!)), op == .openParenthesis {
                let leftOperand = try evaluateExpression(composedOf: makeSubdequeUntilCloseParenthesis(from: elements))
                if elements.count == 0 {
                    return leftOperand
                }
                
                let op = Operator(rawValue: Substring(elements.front()!))
                if op == .openParenthesis {
                    let _ = elements.popFromFront()
                    elements.pushToFront(value: String(Operator.multiplication.rawValue))
                    elements.pushToFront(value: String(leftOperand))
                    return try evaluateExpression(composedOf: elements)
                } else if op == .closeParenthesis {
                    throw InfixNotationEvaluatorError.InvalidSyntax
                }
                
                elements.pushToFront(value: String(leftOperand))
                return try evaluateExpression(composedOf: elements)
                
            } else {
                
                let leftOperand = token
                let op = Operator(rawValue: Substring(elements.popFromFront()!))
                
                if let op = op {
                    if op == .openParenthesis {
                        elements.pushToFront(value: String(op.rawValue))
                        elements.pushToFront(value: String(Operator.multiplication.rawValue))
                        elements.pushToFront(value: leftOperand!)
                        return try evaluateExpression(composedOf: elements)
                        
                    } else if op == .multiplication || op == .division {
                        var rightOperand = elements.popFromFront()
                        if let innerOp = Operator(rawValue: Substring(rightOperand!)), innerOp == .openParenthesis {
                            rightOperand = try String(evaluateExpression(composedOf: makeSubdequeUntilCloseParenthesis(from: elements)))
                        }
                        
                        var result: Double
                        if op == .multiplication {
                            result = Double(leftOperand!)! * Double(rightOperand!)!
                        } else {
                            result = Double(leftOperand!)! / Double(rightOperand!)!
                        }
                        
                        elements.pushToFront(value: String(result))
                        
                        return try evaluateExpression(composedOf: elements)
                        
                    } else if op == .addition || op == .subtraction {
                        if op == .addition {
                            return try Double(leftOperand!)! + evaluateExpression(composedOf :elements)
                        } else {
                            return try Double(leftOperand!)! - evaluateExpression(composedOf: elements)
                        }
                    }
                }
                
                throw InfixNotationEvaluatorError.InvalidSyntax
            }
        }
    }
    
    private func makeSubdequeUntilCloseParenthesis(from  elements: LinkedDeque<String>) throws -> LinkedDeque<String> {
        let subdeque = LinkedDeque<String>()
        var numInnerParenthesesPairs = 0
        
        while elements.count > 0 {
            let next = elements.popFromFront()
            if let op = Operator(rawValue: Substring(next!)) {
                switch op {
                case .multiplication, .division, .addition, .subtraction:
                    subdeque.pushToBack(value: String(op.rawValue))
                case .openParenthesis:
                    numInnerParenthesesPairs += 1
                    subdeque.pushToBack(value: String(op.rawValue))
                case .closeParenthesis:
                    if numInnerParenthesesPairs == 0 {
                        return subdeque
                    }
                    numInnerParenthesesPairs -= 1
                    subdeque.pushToBack(value: String(op.rawValue))
                }
            } else {
                subdeque.pushToBack(value: next!)
            }
        }
        
        throw InfixNotationEvaluatorError.InvalidSyntax
    }
}
