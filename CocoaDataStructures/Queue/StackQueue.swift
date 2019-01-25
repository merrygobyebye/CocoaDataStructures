//
//  StackQueue.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/6/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//
// Elements of Programming Interviews -- Problem 8.8

import Foundation

class StackQueue<T> where T: Comparable {
    
    private var dequeueStack: ArrayStack<T> = ArrayStack<T>()
    private var enqueueStack: ArrayStack<T> = ArrayStack<T>()
    
    private(set) var count: UInt = 0
    
    func enqueue(value: T) {
        enqueueStack.push(value)
        
        count += 1
    }
    
    func dequeue() -> T? {
        if count == 0 {
            return nil
        }
        
        count -= 1
        
        if dequeueStack.count() == 0 {
            while enqueueStack.count() > 0 {
                dequeueStack.push(enqueueStack.pop()!)
            }
        }
        
        return dequeueStack.pop()
    }
    
    func front() -> T? {
        if dequeueStack.count() == 0 {
            while enqueueStack.count() > 0 {
                dequeueStack.push(enqueueStack.pop()!)
            }
        }
        
        return dequeueStack.peek()
    }
}
