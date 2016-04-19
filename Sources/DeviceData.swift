/*
This source file is part of the CoreCityOS open source project

Copyright (c) 2016 CityOS LLC
Licensed under Apache License v2.0

See https://cityos.io/ios/LICENCE.txt for license information
*/

/**
    Describes info data for one hardware device. Most common data is:

    * `id` - id of the device, most commonly ipv6 address
    * `model` - model type of the device
    * `schema` - schema version
    * `version` - device version

    In addition to these properties, `DeviceData` can also store additional
    data with `deviceInfo` dictionary.
*/
public struct DeviceData {
    
    /// Device ID
    public var deviceID: String
    
    /// Device model
    public var model: String?
    
    /// Device schema
    public var schema: String?
    
    /// Device version
    public var version: String?
    
    /// Provides additional object for storing any device specific info
    public var deviceInfo: [String: AnyObject]
    
    /// Creates `DeviceData`
    public init(deviceID: String,
        model: String? = nil,
        schema: String? = nil,
        version: String? = nil,
        deviceInfo info: [String: AnyObject] = [:]) {
            self.deviceID = deviceID
            self.model = model
            self.schema = schema
            self.version = version
            self.deviceInfo = info
    }
}

extension DeviceData : Equatable {
}

public func == (lhs: DeviceData, rhs: DeviceData) -> Bool {
    return lhs.deviceID == rhs.deviceID
}

extension DeviceData {
    public var description: String {
        return "Device:\n--- \nID: \(deviceID) \nModel: \(model ?? "Not specified")\nVersion: \(version ?? "Not specified")\nAdditional info: \(deviceInfo ?? [:])"
    }
}

//MARK: Subscript extensions for DeviceData structure
extension DeviceData {
    public subscript(key: String) -> AnyObject? {
        get {
            return deviceInfo[key]
        }
        
        set {
            deviceInfo[key] = newValue
        }
    }
}
