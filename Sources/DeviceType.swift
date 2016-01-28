//
//  DeviceType.swift
//  CoreCityOS
//
//  Created by Said Sikira on 1/28/16.
//  Copyright © 2016 CityOS. All rights reserved.
//

/**
    Structures that adopt this protocol can be used to create single device instance,
    that mirrors harware device.
    
    ## Example implementation
    
    ```swift
    struct Lamp : DeviceType {
        var deviceData: DeviceData!
        var creationDate = NSDate()
        var location: DeviceLocation!
        var dataCollection = CustomLampDataCollection()

        /// Init methods...
    }
    ```
*/
public protocol DeviceType {
    
    /// This property is used to store device ID info, such as `Schema ID` or `Model ID`
    var deviceData: DeviceData { get set }
    
    /// Creation date of the device
    var creationDate: NSDate? { get set }
    
    /// Device location
    var location: DeviceLocation { get }
    
    /// Structure that adopts `LiveDataCollectionType` protocol that is used to record device data
    var dataCollection: LiveDataCollectionType { get set }
    
}
