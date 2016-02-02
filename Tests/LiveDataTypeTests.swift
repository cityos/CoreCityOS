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
        var humidity = LiveData(
            dataType: .Humidity,
            jsonKey: "hum",
            unitNotation: "%"
        )
        
        for i in 1...10 {
            let dataPoint = DataPoint(value: Double(i))
            humidity.addDataPoint(dataPoint)
        }
        
        XCTAssert(humidity.dataPoints.count == 10, "dataPoint count is not correct")
    }
    
    func testLiveDataCurrentDataPoint() {
        var humidity = LiveData(
            dataType: .Humidity,
            jsonKey: "hum",
            unitNotation: "%"
        )
        
        for i in 1...10 {
            let dataPoint = DataPoint<Int>(value: i)
            humidity.addDataPoint(dataPoint)
        }
        
        XCTAssert(humidity.currentDataPoint! == humidity.dataPoints.first!, "dataPoint does not have correct value")
    }
    
    func testCustomOperators() {
        var humidity = LiveData(
            dataType: .Humidity,
            jsonKey: "hum",
            unitNotation: "%"
        )
        
        let dataPoint = DataPoint(value: 20)
        let anotherDataPoint = DataPoint(value: 40.3)
        
        humidity <~ dataPoint
        humidity <~ anotherDataPoint
        
        XCTAssert(humidity.dataPoints.count == 2, "dataPoint count is not correct when using <~ operator to add single data point")
        
        var dataPoints = [DataPoint<Double>]()
        
        for i in 1...10 {
            dataPoints.append(DataPoint(value: Double(i)))
        }
        
        humidity <~ dataPoints
        
        XCTAssert(humidity.dataPoints.count == 12, "dataPoint count is not correct when using <~ operator to add array of data points")
    }
}
