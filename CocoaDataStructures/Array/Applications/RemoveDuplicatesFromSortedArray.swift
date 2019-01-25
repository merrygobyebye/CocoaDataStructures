//
//  File.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/24/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//
// Elements of Programming Interviews -- Problem 5.5

import Foundation

extension Array where Element == Int {
    
    mutating func removeDuplicateElements() {
        
        guard self.count > 1 else { return }
        
        var currentValue = self[0]
        var currentIndex = 1
        var swapIndex: Int?

        while currentIndex < self.count {
           
            if swapIndex != nil {
                self[swapIndex!] = currentValue
                swapIndex = swapIndex! + 1
            }
            
            if self[currentIndex] == currentValue {
                swapIndex = swapIndex ?? currentIndex
                while currentIndex < self.count && self[currentIndex] == currentValue {
                    currentIndex += 1
                }
                
                if currentIndex < self.count {
                    currentValue = self[currentIndex]
                    currentIndex += 1
                }
            } else {
                currentValue = self[currentIndex]
                currentIndex += 1
            }
        }
        
        if swapIndex != nil {
            self[swapIndex!] = self.last!
        }
    }
}
