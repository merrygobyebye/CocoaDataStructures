//
//  LinkedQueue.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/3/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import Foundation

class LinkedQueue<T> {
    
    private class Node {
        let value: T?
        var next: Node?
        
        init(value: T?) {
            self.value = value
        }
    }
    
    private var head = Node(value: nil)
    private var tail: Node
    private(set) var count = 0
    
    init() {
        tail = head
    }
    
    func front() -> T? {
        return head.next?.value
    }
    
    func dequeue() -> T? {
        guard let front = front() else { return nil }
        head.next = head.next?.next
        count -= 1
        if count == 0 {
            tail = head
        }
       
        return front
    }
    
    func enqueue(value: T) {
        let node = Node(value: value)
        tail.next = node
        tail = node
        count += 1
    }
}

