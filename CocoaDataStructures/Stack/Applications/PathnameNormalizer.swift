//
//  PathnameNormalizer.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 12/3/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import Foundation

enum Directory: Substring {
    case current = "."
    case parent = ".."
}

enum PathnameNormalizerError: Error {
    case InvalidPathname
}

class PathnameNormalizer {
    
    private let pathname: String
    private let stack: ArrayStack<Substring> = ArrayStack()
    
    init(pathname: String) {
        self.pathname = pathname
    }
    
    func normalized() throws -> String {
        let isAbsolutePath = pathname.first == "/"
        
        let split = pathname.split(separator: "/")
        for substring in split {
            if let directory = Directory(rawValue: substring) {
                if directory == .parent {
                    try handleParentDirectory(isAbsolutePath: isAbsolutePath)
                }
            } else {
                try handleDirectory(named: substring)
            }
        }
    
        let normalized = stack.reversedJoinedBy(separator: "/")
        return isAbsolutePath ? "/" + normalized : normalized
    }
    
    func handleParentDirectory(isAbsolutePath: Bool) throws {
        if isAbsolutePath {
            guard let _ = stack.pop() else { throw PathnameNormalizerError.InvalidPathname }
        } else {
            if stack.count() == 0 {
                stack.push(Directory.parent.rawValue)
            } else {
                let _ = stack.pop()
            }
        }
    }
    
    func handleDirectory(named name: Substring) throws {
        if (hasOnlyAlphaNumericCharacters(in: name)) {
            stack.push(name)
        } else {
            throw PathnameNormalizerError.InvalidPathname
        }
    }
    
    func hasOnlyAlphaNumericCharacters(in substring: Substring) -> Bool {
        let characterSet = CharacterSet(charactersIn: String(substring))
        let alphanumerics = CharacterSet.alphanumerics
        
        return characterSet.isSubset(of: alphanumerics)
    }
}

extension ArrayStack where T == Substring {
    
    func reversedJoinedBy(separator: String) -> String {
        var reversed: [Substring] = []
        while let substring = self.pop() {
            reversed.append(substring)
        }
        reversed.reverse()
        
        return reversed.joined(separator: separator)
    }
}
