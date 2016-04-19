//
//  DeviceDataTests.swift
//  CoreCityOS
//
//  Created by Said Sikira on 4/19/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

import XCTest
@testable import struct CoreCityOS.DeviceData

class DeviceDataTests: XCTestCase {
    
    func testSubscript() {
        var dev = DeviceData(deviceID: "test-device")
        dev["value1"] = 12345
        dev["value2"] = "abc"
        
        if let value1 = dev.deviceInfo["value1"] as? Int {
            XCTAssert(value1 == 12345, "Wrong Int value")
        }
        
        if let value1 = dev.deviceInfo["value2"] as? String {
            XCTAssert(value1 == "abc", "Wrong String value")
        }
    }
}
