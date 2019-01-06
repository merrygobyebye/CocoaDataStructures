//
//  CircularQueue.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/5/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import Foundation

class CircularQueue<T> {
    
    private(set) var capacity: Int
    private var array: UnsafeMutablePointer<T>
    private var indexOfHead: Int = -1
    private var indexOfTail: Int = -1
    
    private(set) var count: UInt = 0
    
    init(capacity: UInt) {
        self.capacity = Int(capacity)
        array = UnsafeMutablePointer<T>.allocate(capacity: self.capacity)
    }
    
    func enqueue(value: T) {
        if count == capacity {
            dynamicallyResize(in: .Up)
        }
        
        if count == 0 {
            indexOfHead = 0
            indexOfTail = 0
        } else {
            indexOfTail += 1
            if indexOfTail == capacity {
                indexOfTail = 0
            }
        }
        
        (array + Int(indexOfTail)).initialize(to: value)
        count += 1
    }
    
    func dequeue() -> T? {
        if count == 0 {
            return nil
        }
        
        let toReturn = array[indexOfHead]
        (array + indexOfHead).deinitialize(count: 1)
        
        indexOfHead += 1
        if indexOfHead == capacity {
            indexOfHead = 0
        }
        
        count -= 1
        
        if count > 0 && count == (capacity - 1) / 2 {
            dynamicallyResize(in: .Down)
        }
        
        return toReturn
    }
    
    func front() -> T? {
        return count > 0 ? array[indexOfHead] : nil
    }
    
    func dynamicallyResize(in direction: ResizeDirection) {
        let oldCapacity = capacity
        let cutoff: Int
        
        switch direction {
        case .Up:
            capacity = capacity * 2 + 1
            cutoff = Int(oldCapacity) - 1
        case .Down:
            capacity = (capacity - 1) / 2
            cutoff = Int(capacity) - 1
        }
        
        let newArray = UnsafeMutablePointer<T>.allocate(capacity: Int(capacity))
        var oldIndex = indexOfHead
        for newIndex in 0...cutoff {
            (newArray + newIndex).initialize(to: array[oldIndex])
            oldIndex += 1
            if oldIndex == oldCapacity {
                oldIndex = 0
            }
        }
        
        indexOfHead = 0
        indexOfTail = direction == .Up ? oldCapacity - 1 : capacity - 1
        array.deallocate()
        array = newArray
    }
    
    enum ResizeDirection {
        case Up
        case Down
    }
}
