//
//  DeviceTypeTests.swift
//  CoreCityOS
//
//  Created by Said Sikira on 3/25/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import XCTest
@testable import CoreCityOS

/// Test device
internal class TestDevice: DeviceType {
    var deviceData = DeviceData(deviceID: "12345")
    var creationDate: NSDate? = NSDate()
    var location: DeviceLocation? = DeviceLocation(latitude: 12.5785, longitude: 25.32636)
    var dataCollection: LiveDataCollectionType = TestDataCollection()
}

class DeviceTypeTests: XCTestCase {
    
    var device: TestDevice!
    
    override func setUp() {
        super.setUp()
        device = TestDevice()
    }
    
    func testSubscriptsGet() {
        let temperature = device[.Temperature]
        
        XCTAssert(temperature != nil, "Temperature property should exist")
        XCTAssert(temperature?.jsonKey == "temp", "Temperature property should have temp json key")
    }
    
    func testSubscriptSet() {
        device[.Temperature]?.addDataPoint(DataPoint(value: 20))
        device[.Temperature]?.addDataPoint(DataPoint(value: 40))
        
        XCTAssert(device[.Temperature]?.currentDataPoint?.value == 40, "Current data point should be equal to 20")
        XCTAssert(device[.Temperature]?.dataPoints.count == 2, "Data points count should be 2")
    }
}
