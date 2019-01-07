//
//  LinkedQueue.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 12/28/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import Foundation

class LinkedDeque<T> {
    
    private class Node {
        var prev: UnsafeMutablePointer<Node>?
        var next: UnsafeMutablePointer<Node>?
        var value: T?
        
        init(value: T?) {
            self.value = value
        }
    }
    
    private var head: UnsafeMutablePointer<Node> = UnsafeMutablePointer<Node>.allocate(capacity: 1)
    private var tail: UnsafeMutablePointer<Node>?
    private(set) var count = 0
    
    init() {
        head.initialize(to: Node(value: nil))
        tail = head.pointee.next
    }
   
    
    func pushToBack(value: T) {
        let node = UnsafeMutablePointer<Node>.allocate(capacity: 1)
        node.initialize(to: Node(value: value))
        if tail == nil {
            head.pointee.next = node
        } else {
            tail?.pointee.next = node
        }
        
        let prev = tail
        tail = node
        tail?.pointee.prev = prev ?? head
        count += 1
    }
    
    func pushToFront(value: T) {
        let node = UnsafeMutablePointer<Node>.allocate(capacity: 1)
        node.initialize(to: Node(value: value))
        if tail == nil {
            head.pointee.next = node
            tail = node
            tail?.pointee.prev = head
        } else {
            head.pointee.value = value
            let first = head
            head = UnsafeMutablePointer<Node>.allocate(capacity: 1)
            head.initialize(to: Node(value: nil))
            head.pointee.next = first
            first.pointee.prev = head
        }
        
        count += 1
    }
    
    func popFromFront() -> T? {
        if let first = head.pointee.next?.pointee.value {
            let toDealloc = head.pointee.next
            head.pointee.next = head.pointee.next?.pointee.next
            toDealloc?.deallocate()
            head.pointee.next?.pointee.prev = head
            count -= 1
            
            if count == 0 {
                tail = nil
            }
            
            return first
        }
        
        return nil
    }
    
    func popFromBack() -> T? {
        if let back = tail, let itemAtBack = tail?.pointee.value {
            back.pointee.prev?.pointee.next = nil
            back.deallocate()
            count -= 1
            tail = count == 0 ? nil : tail?.pointee.prev
            
            return itemAtBack
        }
        
        return nil
    }
    
    func front() -> T? {
        if let first = head.pointee.next?.pointee.value {
            return first
        }
        
        return nil
    }
    
    func back() -> T? {
        return tail?.pointee.value
    }
    
    func debugPrint() {
        print("---Front---")
        
        var item = head.pointee.next
        while item != nil {
            print(String(describing: item?.pointee.value.debugDescription))
            item = item?.pointee.next
        }
        
        print("---Back----")
    }
}
