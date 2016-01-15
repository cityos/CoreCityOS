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

class LiveDataTypeTests: XCTestCase {

    func testLiveDataAddDataPoints() {
        var humidity = LiveData<Double>(
            dataType: .Humidity,
            jsonKey: "hum",
            unitNotation: "%"
        )
        
        for i in 1...10 {
            let dataPoint = DataPoint<Double>(value: Double(i))
            humidity.addDataPoint(dataPoint)
        }
        
        XCTAssert(humidity.dataPoints.count == 10, "dataPoint count is not correct")
    }
    
    func testLiveDataCurrentDataPoint() {
        var humidity = LiveData<Double>(
            dataType: .Humidity,
            jsonKey: "hum",
            unitNotation: "%"
        )
        
        for i in 1...10 {
            let dataPoint = DataPoint<Double>(value: Double(i))
            humidity.addDataPoint(dataPoint)
        }
        
        XCTAssert(humidity.currentDataPoint! == humidity.dataPoints.first!, "dataPoint does not have correct value")
    }
}
