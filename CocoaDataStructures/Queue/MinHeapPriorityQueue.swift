//
//  HeapPriorityQueue.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 9/3/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import UIKit

class MinHeapPriorityQueue<T> where T: Comparable {
    
    private var data: [T] = []
    
    // MARK: - Public
    func size() -> Int {
        return data.count
    }
    
    func add(_ node: T) {
        data.append(node)
        upheap(from: data.count - 1)
    }
    
    func min() -> T? {
        guard data.count > 0 else { return nil }
        
        return data[0]
    }
    
    func removeMin() -> T? {
        guard data.count > 0 else { return nil }
        
        swap(nodeAtIndex: 0, withNodeAtIndex: data.count - 1)
        let min = data.removeLast()
        downheap(from: 0)
        
        return min
    }
    
    // MARK: - Private
    private func parentIndexOf(nodeAtIndex index: Int) -> Int {
        return (index - 1) / 2;
    }
    
    private func leftChildIndexOf(nodeAtIndex index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndexOf(nodeAtIndex index: Int) -> Int {
        return 2 * index + 2
    }
    
    private func hasLeftChildFor(nodeAtIndex index: Int) -> Bool {
        return leftChildIndexOf(nodeAtIndex: index) < data.count
    }
    
    private func hasRightChildFor(nodeAtIndex index: Int) -> Bool {
        return rightChildIndexOf(nodeAtIndex: index) < data.count
    }
    
    private func swap(nodeAtIndex firstIndex: Int, withNodeAtIndex secondIndex: Int) {
        data.swapAt(firstIndex, secondIndex)
    }
    
    private func upheap(from index: Int) {
        let parentIndex = parentIndexOf(nodeAtIndex: index)
        if index > 0 && data[index] < data[parentIndex] {
            swap(nodeAtIndex: index, withNodeAtIndex: parentIndex)
            upheap(from: parentIndex)
        }
    }
    
    private func downheap(from index: Int) {
        if hasLeftChildFor(nodeAtIndex: index) {
            let leftChildIndex = leftChildIndexOf(nodeAtIndex: index)
            var smallestChildIndex = leftChildIndex
            
            if hasRightChildFor(nodeAtIndex: index) {
                let rightChildIndex = rightChildIndexOf(nodeAtIndex: index)
                if data[rightChildIndex] < data[leftChildIndex] {
                    smallestChildIndex = rightChildIndex
                }
            }
            
            if data[smallestChildIndex] < data[index] {
                swap(nodeAtIndex: index, withNodeAtIndex: smallestChildIndex)
                downheap(from: smallestChildIndex)
            }
        }
    }
}
