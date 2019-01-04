//
//  BinaryTree.swift
//  CocoaDataStructures
//
//  Created by Eric Fisher on 1/3/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import Foundation

class BinaryTreeNode<T> {
    
    let value: T
    var leftChild: BinaryTreeNode<T>?
    var rightChild: BinaryTreeNode<T>?
    
    init(value: T) {
        self.value = value
    }
}

class BinaryTree<T> {
    
    var root: BinaryTreeNode<T>?
    var isEmpty: Bool {
        return root == nil
    }
}
