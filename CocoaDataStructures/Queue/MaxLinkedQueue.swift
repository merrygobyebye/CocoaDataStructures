//
//  MaxLinkedQueue.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/6/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import Foundation

class MaxLinkedQueue<T> where T: Comparable {
    
    class Node: Comparable {
        var value: T?
        var next: Node?
        var uuid: UUID
        
        init(value: T?) {
            self.value = value
            uuid = UUID.init()
        }
        
        init(other: Node) {
            self.value = other.value
            self.uuid = other.uuid
            self.next = other.next
        }
        
        static func < (lhs: MaxLinkedQueue<T>.Node, rhs: MaxLinkedQueue<T>.Node) -> Bool {
            return lhs.uuid.uuidString.lowercased() < rhs.uuid.uuidString.lowercased()
        }
        
        static func == (lhs: MaxLinkedQueue<T>.Node, rhs: MaxLinkedQueue<T>.Node) -> Bool {
            return lhs.uuid == rhs.uuid
        }
    }
    
    private var head = Node(value: nil)
    private var tail: Node
    private(set) var count = 0
    private var maxValues = LinkedDeque<Node>()
    var max: T? {
        return maxValues.front()?.value
    }
    
    init() {
        tail = head
    }
    
    func front() -> T? {
        return head.next?.value
    }
    
    func dequeue() -> T? {
        guard let toDequeue = head.next else { return nil }
        head.next = head.next?.next
        count -= 1
        if count == 0 {
            tail = head
        }
        
        if toDequeue == maxValues.front() {
            let _ = maxValues.popFromFront()
        }
        
        return toDequeue.value
    }
    
    func enqueue(value: T) {
        let node = Node(value: value)
        
        // max
        if let maxValue = maxValues.front()?.value, value > maxValue {
            maxValues = LinkedDeque<Node>()
        } else if let lastMaxValue = maxValues.back()?.value {
            var lastMaxValue: T? = lastMaxValue
            while lastMaxValue != nil, value >= lastMaxValue! {
                let _ = maxValues.popFromBack()
                lastMaxValue = maxValues.back()?.value
            }
        }
        
        maxValues.pushToBack(value: node)
        // end max
        
        tail.next = node
        tail = node
        count += 1
    }
}
