//
//  ArrayStack.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 11/11/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import UIKit

class ArrayStack<T>: NSObject where T: Comparable {
    
    var array: [T] = []
    
    func push(_ obj: T) {
        array.append(obj)
    }
    
    func pop() -> T? {
        return array.isEmpty ? nil : array.removeLast()
    }
    
    func peek() -> T? {
        return array.last
    }
    
    func max() -> T? {
        guard var max = array.first else {
            return nil
        }
        
        guard array.count > 1 else {
            return max
        }
        
        for i in 1...array.count - 1 {
            let candidate = array[i]
            if candidate > max {
                max = candidate
            }
        }
        
        return max
    }
}
