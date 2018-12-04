//
//  PathnameNormalizerTest.swift
//  CocoaDataStructuresTests
//
//  Created by Eric Fisher on 12/3/18.
//  Copyright © 2018 merrygobyebye. All rights reserved.
//

import XCTest
@testable import CocoaDataStructures

class PathnameNormalizerTest: XCTestCase {

    func testPathnameNormalizer() {
        var pathname = "/foo/../^3%@)(#@bar"
        var normalizer = PathnameNormalizer(pathname: pathname)
        XCTAssertThrowsError(try normalizer.normalized())
        
        pathname = "/foo/../../"
        normalizer = PathnameNormalizer(pathname: pathname)
        XCTAssertThrowsError(try normalizer.normalized())
        
        pathname = "/foo/////../bar/////////////////"
        normalizer = PathnameNormalizer(pathname: pathname)
        XCTAssertEqual("/bar", try normalizer.normalized())
        
        pathname = "foo/../../bar/////"
        normalizer = PathnameNormalizer(pathname: pathname)
        XCTAssertEqual("../bar", try normalizer.normalized())
    }
}
