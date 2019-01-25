//
//  WellFormedParenthesesEvaluator.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 12/2/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//
// Elements of Programming Interviews -- Problem 8.3

import UIKit

enum OpenParenthesis: Character {
    case parenthesis = "("
    case squareBracket = "["
    case curlyBracket = "{"
}

enum CloseParenthesis: Character {
    case parenthesis = ")"
    case squareBracket = "]"
    case curlyBracket = "}"
    
    static func from(openParenthesis: OpenParenthesis) -> CloseParenthesis {
        switch openParenthesis {
        case .parenthesis:
            return .parenthesis
        case .squareBracket:
            return .squareBracket
        case .curlyBracket:
            return .curlyBracket
        }
    }
}

enum WellFormedParenthesesEvaluatorError: Error {
    case InvalidSyntax
}


class WellFormedParenthesesEvaluator {
    
    private(set) var stringRepresentation: String
    private var stack: ArrayStack<Character> = ArrayStack()
    private var result: Bool?
    
    init(stringRepresentation: String) {
        self.stringRepresentation = stringRepresentation
    }
    
    public func evaluate() throws -> Bool {
        if let result = result {
            return result
        }
        
        for character in stringRepresentation {
            if let openParenthesis = OpenParenthesis(rawValue: character) {
                stack.push(CloseParenthesis.from(openParenthesis: openParenthesis).rawValue)
            } else if let closeParenthesis = CloseParenthesis(rawValue: character),
                let top = stack.peek(),
                let match = CloseParenthesis(rawValue: top) {
                
                guard closeParenthesis == match else { break }
                let _ = stack.pop()
            } else {
                throw WellFormedParenthesesEvaluatorError.InvalidSyntax
            }
        }
        
        result = stack.count() == 0
        return result!
    }
}
