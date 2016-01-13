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
    
    func testDataPointCreation() {
        let dataPoint = DataPoint(30.00)
        let date = NSDate(timeIntervalSince1970: 1)
        XCTAssert(true, "tre")
        
    }
}
