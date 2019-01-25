//
//  IncreasingDepthOrderTreeNodes.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/3/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//
// Elements of Programming Interviews -- Problem 8.6

import Foundation

extension BinaryTree where T: Any {
    
    func increasingDepthOrderTreeNodeValues() -> [[T]] {
        
        let queue = LinkedQueue<BinaryTreeNode<T>>()
        var nodeValues = [[BinaryTreeNode<T>]]()
        var depth = 0
        
        if let root = self.root {
            nodeValues.append([root])
            depth += 1
            
            while nodeValues.count == depth {
                for node in nodeValues[depth - 1] {
                    if let left = node.leftChild {
                        queue.enqueue(value: left)
                    }
                    
                    if let right = node.rightChild {
                        queue.enqueue(value: right)
                    }
                }
                
                var elementsAtDepth = [BinaryTreeNode<T>]()
                while queue.count > 0 {
                    elementsAtDepth.append(queue.dequeue()!)
                }
                
                if elementsAtDepth.count > 0 {
                    nodeValues.append(elementsAtDepth)
                }
                
                depth += 1
            }
        }
        
        return nodeValues.map{ $0.map { $0.value } }
    }
}
