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
        
        var currentIndex = 1
        var swapIndex = 0
        
        while currentIndex < self.count {
            // duplicate value detected
            if self[currentIndex] == self[currentIndex - 1] || swapIndex != 0 && self[currentIndex] == self[swapIndex - 1] {
                swapIndex = swapIndex == 0 ? currentIndex : swapIndex
                while self[currentIndex] == self[currentIndex - 1] || swapIndex != 0 && self[currentIndex] == self[swapIndex - 1] {
                    currentIndex += 1
                }
            } else {
                // not a duplicate, but a previous duplicate was found, so shift forward
                if swapIndex != 0 {
                    self[swapIndex] = self[currentIndex]
                    swapIndex += 1
                }
                currentIndex += 1
            }
        }
    }
}
