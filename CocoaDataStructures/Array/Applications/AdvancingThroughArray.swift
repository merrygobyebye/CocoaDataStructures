//
//  AdvancingThroughArray.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/24/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//
// Elements of Programming Interviews -- Problem 5.4


import Foundation

extension Array where Element == Int {
    
    func canAdvanceToEnd() -> Bool {
        var furthestAdvancePossible = 0
        
        for i in 0..<self.count {
            furthestAdvancePossible = Swift.max(furthestAdvancePossible, self[i])
        }
        
        return furthestAdvancePossible >= self.count - 1
    }
}
