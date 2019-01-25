//
//  EastToWestSunsetViewCalculator.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/1/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//
// Elements of Programming Interviews -- Problem 8.5

import Foundation

/**
 This class is initialized with an array of buildings with west-facing windows, in east-to-west order,
 and contains one function, which returns the set of the buildings from the east-to-west array that have
 a view of the sunset.
 */
class EastToWestSunsetViewCalculator {

    private let eastToWestBuildings: [Building]
   
    /**
     - Parameters:
        - eastToWestBuildings: an array, ordered from east-to-west, of buildings with west-facing windows
    */
    init(eastToWestBuildings: [Building]) {
        self.eastToWestBuildings = eastToWestBuildings
    }
    
    /**
     - Returns: a set of buildings, from `eastToWestBuildings`, that have a view of the sunset
    */
    func buildingsWithSunsetViews() -> Set<Building> {
        let stack = ArrayStack<Building>()
        for building in eastToWestBuildings {
            
            inner: while stack.count() > 0 {
                if let buildingToEast = stack.peek(), buildingToEast <= building {
                    let _ = stack.pop()
                } else {
                    break inner
                }
            }
            
            stack.push(building)
        }
        
        var set = Set<Building>()
        while stack.count() > 0 {
            if let building = stack.pop() {
                set.insert(building)
            }
        }
        
        return set
    }
}

class Building {
    
    let uuid: UUID
    let height: Double
    
    init(height: Double) {
        self.height = height
        self.uuid = UUID.init()
    }
}

extension Building: Hashable {
    
    public var hashValue: Int {
        return uuid.hashValue
    }
    
    public func hash(into hasher: inout Hasher) {
        uuid.hash(into: &hasher)
    }
    
    static func == (lhs: Building, rhs: Building) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

extension Building: Comparable {
    
    static func < (lhs: Building, rhs: Building) -> Bool {
        return lhs.height < rhs.height
    }
}
