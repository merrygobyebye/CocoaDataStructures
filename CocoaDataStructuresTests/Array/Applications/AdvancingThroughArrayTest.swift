//
//  AdvancingThroughArrayTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 1/24/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class AdvancingThroughArrayTest: XCTestCase {

    func canAdvanceToEnd() {
        let canAdvance = [3, 3, 1, 0, 2, 0, 1]
        XCTAssertEqual(canAdvance.canAdvanceToEnd(), true)
        
        let cannotAdvance = [3, 2, 0, 0, 2, 0 ,1]
        XCTAssertEqual(cannotAdvance.canAdvanceToEnd(), false)
     }

}
