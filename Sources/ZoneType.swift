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

import class Foundation.NSDate

/**
 Structures that adopt this protocol can be used to represent geographical zones that 
 encapsulate all devices in that specifics zone. Devices can be members of more than 
 one zone.
 
 Zones are useful when you want to read aggregated data from devices, or when you want
 to perform specific operation on all devices that the zone manages.
 
 ## Example implementation
 
 ```swift
 struct MyZone: ZoneType {
    var zoneID: String
    var name: String
    var creationDate = NSDate()
    var devices = [DeviceType]
 
    init(zoneID: String, name: String, devices: DeviceType... {
        self.zoneID = zoneID
        self.name = name
        self.devices = devices
    }
 }
 ```
 
 */
public protocol ZoneType {
    
    /// ID of the zone
    var zoneID: String { get }
    
    /// Name of the zone
    var name: String { get }
    
    /// Creation date of the zone
    var creationDate: NSDate? { get }
    
    /// All devices that zone manages
    var devices: [DeviceType] { get set }
}

extension ZoneType {
    
    /// Computes Set of the all device IDs from `devices` array that the zone manages
    public var deviceIDs: Set<String> {
        let allDeviceIDs = self.devices.map { $0.deviceData.deviceID }
        return Set<String>(allDeviceIDs)
    }
}

//MARK: Custom subscript implementation
extension ZoneType {
    
    public subscript(deviceID: String) -> DeviceType? {
        return self.devices
            .filter {$0.deviceData.deviceID == deviceID }
            .first
    }
}
