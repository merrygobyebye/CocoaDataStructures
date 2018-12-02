//
//  ArrayStack.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 11/11/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import UIKit

class ArrayStack<T> where T: Comparable {
    
    private var stack: [T] = []
    private var maxArray: [Int] = []
    private var _max: T?
    private var _count: Int = 0
    
    func push(_ obj: T) {
        stack.append(obj)
        _count += 1
        
        if _max == nil || obj > _max! {
            _max = obj
            maxArray.append(_count - 1)
        } else {
            maxArray.append(_count - 2)
        }
    }
    
    func pop() -> T? {
        guard !stack.isEmpty else { return nil }
        
        maxArray.removeLast()
        _count -= 1
        return stack.removeLast()
    }
    
    func peek() -> T? {
        return stack.last
    }
    
    func count() -> Int {
        return _count
    }
    
    func max() -> T? {
        return _max
    }
}
