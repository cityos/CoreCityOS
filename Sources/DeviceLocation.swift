/*
    This source file is part of the CoreCityOS open source project

    Copyright (c) 2016 CityOS LLC
    Licensed under Apache License v2.0

    See https://cityos.io/ios/LICENCE.txt for license information
*/

/**
    `DeviceLocation` class is used for managing geographical location of a device.
    
    - Warning: Some methods that rely on `CoreLocation` framework may not be available
    on Linux systems
*/
public class DeviceLocation {
    
    /// Device latitude info
    public let latitude: Double
    
    /// Device longitude info
    public let longitude: Double
    
    /**
        Creates instance of `DeviceLocation`
        
        - parameter latitude: Latitude information
        - parameter longitude: Longitude information
    */
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

#if os(iOS) || os(tvOS) || os(OSX)
    import CoreLocation
    
    extension DeviceLocation {
        
        /**
            Computes coordinate property of type `CLLocationCoordinate2D`
            
            - Warning: Not available on Linux
        */
        public var coordinate: CLLocationCoordinate2D {
            return CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude
            )
        }
    }
#endif
