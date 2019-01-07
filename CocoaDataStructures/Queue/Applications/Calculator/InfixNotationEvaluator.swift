//
//  InfixNotationEvaluator.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 12/28/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import Foundation

enum InfixNotationEvaluatorError: Error {
    case InvalidSyntax
}

class InfixNotationEvaluator {
    
    private(set) var stringRepresentation: String

    init(stringRepresentation: String) {
        self.stringRepresentation = stringRepresentation
    }

    func evaluate() throws -> Double {
        let elements = try parse(stringRepresentation: stringRepresentation)
        if let _ = Operator(rawValue: Substring(elements.back()!)) {
            throw InfixNotationEvaluatorError.InvalidSyntax
        }
        
        return try evaluateExpression(composedOf: elements)
    }

    func evaluateExpression(composedOf elements: LinkedDeque<String>) throws -> Double {
        if elements.count == 1 {
            return Double(elements.popFromFront()!)!
        } else {
            let leftOperand = elements.popFromFront()
            let op = Operator(rawValue: Substring(elements.popFromFront()!))
            var rightOperand = elements.front()
            
            if let op = op {
                if op == .multiplication || op == .division {
                    rightOperand = elements.popFromFront()
                    var result: Double
                    if op == .multiplication {
                        result = Double(leftOperand!)! * Double(rightOperand!)!
                    } else {
                        result = Double(leftOperand!)! / Double(rightOperand!)!
                    }
                    
                    elements.pushToFront(value: String(result))
                    
                    return try evaluateExpression(composedOf: elements)
                    
                } else {
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

    func parse(stringRepresentation: String) throws -> LinkedDeque<String> {
        let queue = LinkedDeque<String>()
        var current: String = ""
        try stringRepresentation.forEach { (character: Character) in
            if let op = Operator(rawValue: Substring(String(character))) {
                if !current.isEmpty {
                    queue.pushToBack(value: current)
                }
                
                queue.pushToBack(value: String(op.rawValue))
                current = ""
            } else if character == "." {
                current.append(character)
            } else {
                current.append(character)
                let double = Double(current)
                if double == nil {
                    throw InfixNotationEvaluatorError.InvalidSyntax
                }
            }
        }
        
        if !current.isEmpty {
            queue.pushToBack(value: current)
        }

        return queue
    }
    
}
