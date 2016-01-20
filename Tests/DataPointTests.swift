//===----------------------------------------------------------------------===//
//
// This source file is part of the cityos.io CoreCityOS open source project
//
// Copyright (c) 2016 CityOS LLC
// Licensed under Apache License v2.0
//
// See https://cityos.io/ios/LICENCE.txt for license information
//
//===----------------------------------------------------------------------===//

import XCTest
@testable import CoreCityOS

class DataPointTests: XCTestCase {
    
    func testEquatable() {
        let dataPoint = DataPoint(value: 50)
        let otherDataPoint = DataPoint(value: 50)
        
        XCTAssert(dataPoint == otherDataPoint, "Data points are not equal")
    }
    
    func testComparable() {
        var dataPoint = DataPoint(value: 25.3)
        var otherDataPoint = DataPoint(value: 30.0)
        
        XCTAssert(dataPoint < otherDataPoint, "Data points should be comparable with <")
        
        dataPoint.value = 10
        otherDataPoint.value = 20
        
        XCTAssert(dataPoint < otherDataPoint, "Data points should be comparable with >")
    }
}
