/*
 This source file is part of the CoreCityOS open source project
 
 Copyright (c) 2016 CityOS LLC
 Licensed under Apache License v2.0
 
 See https://cityos.io/ios/LICENCE.txt for license information
 */

import class Foundation.NSDate

/**
 Structures that adopt this protocol can be used to create single device instance,
 that mirrors harware device.
 
 ### Example implementation
 
 ```swift
 struct Lamp: DeviceType {
     var deviceData: DeviceData = DeviceData(deviceID: "abc-123")
     var creationDate = NSDate()
     var location: DeviceLocation?
     var dataCollection = CustomLampDataCollection()
 }
 ```
 */
public protocol DeviceType {
    
    /// This property is used to store device ID info, such as `Schema ID` or `Model ID`
    var deviceData: DeviceData { get set }
    
    /// Device name (optional)
    var name: String? { get set }
    
    /// Creation date of the device
    var creationDate: NSDate? { get }
    
    /// Device location
    var location: DeviceLocation? { get }
    
    /// Structure that adopts `LiveDataCollectionType` protocol that is used to record device data
    var dataCollection: LiveDataCollectionType { get set }
    
}

//MARK: Subscript methods
extension DeviceType {
    
    public subscript (type: DataType) -> LiveDataType? {
        get {
            return dataCollection.allReadings
                .filter { $0.type.dataIdentifier == type.dataIdentifier }
                .first
        }
        
        set {
            let index = dataCollection.allReadings.indexOf { $0.type.dataIdentifier == type.dataIdentifier }
            if let index = index {
                dataCollection.allReadings[index] = newValue!
            }
        }
    }
}

//MARK: CustomStringConvertible implementation
extension DeviceType {
    
    public var description: String {
        return "ID: \(deviceData.deviceID)\nLocation: \(location),\nData: \(dataCollection.dataTypes)"
    }
    
    public var debugDescription: String {
        return "\(deviceData.description)\nLocation: \(location),\nData: \(dataCollection.dataTypes)"
    }
}
