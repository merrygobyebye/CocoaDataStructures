//
//  IncreasingDepthOrderTreeNodesTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 1/3/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class IncreasingDepthOrderTreeNodeValuesTest: XCTestCase {

    func testIncreasingDepthOrderTreeNodeValues() {
        let tree = BinaryTree<UInt>()
        // depth 0
        tree.root = BinaryTreeNode<UInt>(value: 314)
        
        // depth 1
        tree.root?.leftChild = BinaryTreeNode<UInt>(value: 6)
        tree.root?.rightChild = BinaryTreeNode<UInt>(value: 6)
        
        // depth 2
        tree.root?.leftChild?.leftChild = BinaryTreeNode<UInt>(value: 271)
        tree.root?.leftChild?.rightChild = BinaryTreeNode<UInt>(value: 561)
        tree.root?.rightChild?.leftChild = BinaryTreeNode<UInt>(value: 2)
        tree.root?.rightChild?.rightChild = BinaryTreeNode<UInt>(value: 271)
        
        // depth 3
        tree.root?.leftChild?.leftChild?.leftChild = BinaryTreeNode<UInt>(value: 28)
        tree.root?.leftChild?.leftChild?.rightChild = BinaryTreeNode<UInt>(value: 0)
        tree.root?.leftChild?.rightChild?.leftChild = nil
        tree.root?.leftChild?.rightChild?.rightChild = BinaryTreeNode<UInt>(value: 3)
        tree.root?.rightChild?.leftChild?.leftChild = nil
        tree.root?.rightChild?.leftChild?.rightChild = BinaryTreeNode<UInt>(value: 1)
        tree.root?.rightChild?.rightChild?.leftChild = nil
        tree.root?.rightChild?.rightChild?.rightChild = BinaryTreeNode<UInt>(value: 28)
        
        // depth 4
        tree.root?.leftChild?.leftChild?.leftChild?.leftChild = nil
        tree.root?.leftChild?.leftChild?.leftChild?.rightChild = nil
        tree.root?.leftChild?.leftChild?.rightChild?.leftChild = nil
        tree.root?.leftChild?.leftChild?.rightChild?.rightChild = nil
        tree.root?.leftChild?.rightChild?.leftChild?.leftChild = nil
        tree.root?.leftChild?.rightChild?.leftChild?.rightChild = nil
        tree.root?.leftChild?.rightChild?.rightChild?.leftChild = BinaryTreeNode<UInt>(value: 17)
        tree.root?.leftChild?.rightChild?.rightChild?.rightChild = nil
        
        tree.root?.rightChild?.leftChild?.leftChild?.leftChild = nil
        tree.root?.rightChild?.leftChild?.leftChild?.rightChild = nil
        tree.root?.rightChild?.leftChild?.rightChild?.leftChild = BinaryTreeNode<UInt>(value: 401)
        tree.root?.rightChild?.leftChild?.rightChild?.rightChild = BinaryTreeNode<UInt>(value: 257)
        tree.root?.rightChild?.rightChild?.leftChild?.leftChild = nil
        tree.root?.rightChild?.rightChild?.leftChild?.rightChild = nil
        tree.root?.rightChild?.rightChild?.rightChild?.leftChild = nil
        tree.root?.rightChild?.rightChild?.rightChild?.rightChild = nil
        
        // depth 5
        tree.root?.rightChild?.leftChild?.rightChild?.leftChild?.rightChild = BinaryTreeNode<UInt>(value: 641)
        
        let actual = tree.increasingDepthOrderTreeNodeValues()
        let expected:[[UInt]] = [[314], [6,6], [271,561,2,271], [28,0,3,1,28], [17,401,257], [641]]
        XCTAssertEqual(actual, expected)
    }

}
