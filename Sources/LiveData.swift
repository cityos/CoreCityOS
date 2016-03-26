/*
This source file is part of the CoreCityOS open source project

Copyright (c) 2016 CityOS LLC
Licensed under Apache License v2.0

See https://cityos.io/ios/LICENCE.txt for license information
*/

/// Implementation of `LiveDataType` protocol.
public struct LiveData: LiveDataType {
    
    /// JSON key under which data value is stored
    public var jsonKey: String
    
    /// Data type with identifier, for example Temperature or Humidity
    public var type: DataType
    
    /// Unit identifier, for example % or MpH
    public var unitNotation: String
    
    /// All data points
    public var dataPoints = [DataPoint]()
    
    /**
        Creates `LiveData` instance
        
        - parameter dataType: Type of data this instance stores, for example Temperature
        - parameter jsonKey: JSON key that can be used within Serializer class
        - parameter unitNotation: Custom unit notation for data type, for example Mhw for Energy or db for Noise
    */
    public init(dataType type: DataType,
        jsonKey key: String,
        unitNotation notation: String) {
            self.jsonKey = key
            self.unitNotation = notation
            self.type = type
    }
}

extension LiveData: CustomStringConvertible, CustomDebugStringConvertible {
}
