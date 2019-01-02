//
//  EastToWestSunsetViewCalculatorTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 1/1/19.
//  Copyright © 2019 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class EastToWestSunsetViewCalculatorTest: XCTestCase {

    func testEastToWestSunsetVieWCalculator() {
        let buildingA = Building(height: 2.2)
        let buildingB = Building(height: 8.5)
        let buildingC = Building(height: 10.00001)
        let buildingD = Building(height: 10.00000)
        let buildingE = Building(height: 8.0)
        let buildingF = Building(height: 2.1)
        let buildingG = Building(height: 6.3)
        let buildingH = Building(height: 7.2)
        let buildingI = Building(height: 0.1)
        
        let buildings = [ buildingA, buildingB, buildingC, buildingD, buildingE, buildingF, buildingG, buildingH, buildingI ]
        let calculator = EastToWestSunsetViewCalculator(eastToWestBuildings: buildings)
        let expected = Set<Building>(arrayLiteral: buildingC, buildingD, buildingE, buildingH, buildingI)
        let actual = calculator.buildingsWithSunsetViews()
        
        XCTAssertEqual(expected, actual)
    }

}
