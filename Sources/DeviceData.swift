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

/** Describes data that define one hardware device. Most common data is:
 * `id` - id of the device, most commonly ipv6 address
 * `model` - model type of the device
 * `schema` - schema version
 * `version` - device version
 */
public struct DeviceData {
    
    /// Device ID
    public var id : String
    
    /// Device model
    public var model : String?
    
    /// Device schema
    public var schema : String?
    
    /// Device version
    public var version : String?
    
    /// Provides additional object for storing any device specific info
    public var deviceInfo : [String: AnyObject]?
    
    public init(id: String, model : String? = nil, schema: String? = nil, version: String? = nil,deviceInfo info: [String: AnyObject]? = nil) {
        self.id = id
        self.model = model
        self.schema = schema
        self.version = version
        self.deviceInfo = info
    }
}
