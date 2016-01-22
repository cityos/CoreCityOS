//
//  LiveDataCollectionTests.swift
//  CoreCityOS
//
//  Created by Said Sikira on 1/20/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import XCTest
import CoreCityOS

class TestDataCollection : LiveDataCollectionType {
    var deviceData = DeviceData(deviceID: "test-device")
    var creationDate = NSDate()
    var allReadings = [LiveDataType]()
    
    var temperature : LiveDataType {
        return LiveData(
            dataType: .Temperature,
            jsonKey: "temp",
            unitNotation: "C"
        )
    }
    
    var noise : LiveDataType {
        return LiveData(
            dataType: .Noise,
            jsonKey: "noise",
            unitNotation: "dB"
        )
    }
    
    init() {
        self.allReadings = [
            temperature,
            noise
        ]
    }
}

class LiveDataCollectionTests: XCTestCase {
    var testDataCollection : LiveDataCollectionType!
    
    override func setUp() {
        self.testDataCollection = TestDataCollection()
    }
    
    func testAllReadings() {
        XCTAssert(testDataCollection.allReadings.count != 0, "All readings count should not be zero")
    }
    
    func testSubscriptsGet() {
        let temperature = testDataCollection[.Temperature]
        let noise = testDataCollection["noise"]
        
        XCTAssert(temperature != nil, "Temperature property should exist")
        XCTAssert(noise != nil, "Noise property should exist")
    }
    
    func testSubscriptsSet() {
        testDataCollection[.Temperature]?.addDataPoint(DataPoint(value: 20))
        testDataCollection[.Temperature]?.addDataPoint(DataPoint(value: 40))
        
        XCTAssert(testDataCollection[.Temperature]?.currentDataPoint?.value == 40, "Current data point should be equal to 20")
        XCTAssert(testDataCollection[.Temperature]?.dataPoints.count == 2, "Data points count should be 2")
    }
    
    func testDataPointMechanism() {
        var temperature = testDataCollection.allReadings[0]
        
        for i in 1...10 {
            let dataPoint = DataPoint(value: Double(i))
            temperature.addDataPoint(dataPoint)
        }
        
        XCTAssert(temperature.dataPoints.count == 10, "Data point count should be equal to 10")
    }
}
