/*
This source file is part of the CoreCityOS open source project

Copyright (c) 2016 CityOS LLC
Licensed under Apache License v2.0

See https://cityos.io/ios/LICENCE.txt for license information
*/

/**
 Data type structure is used to define types of data that devices are capable
 of reading. `DataType` by default contains some types:

 * Energy
 * Temperature
 * Humidity
 * NaturalLight
 * CarbonDioxide
 * ParticleMeter
 * Noise
 
 Additional data types can be defined via extension of `DataType` like:

 ```swift
 extension DataType {
    static let AirPressure = DataType(dataIdentifier: "Air Pressure")
 }
 ```

`DataType` can be used with subscript functions implemented on `LiveDataCollectionType`
*/
public struct DataType {
    
    /// Human-readable form of data identifier, for example Temperature or Humidity
    public let dataIdentifier: String
    
    /** 
        Use dataIdetifier object for the human like data type definition
        such as Temperature or Carbon Dioxide
    */
    public init(dataIdentifier identifier: String) {
        self.dataIdentifier = identifier
    }
    
    /// Energy data type
    public static let Energy = DataType(dataIdentifier: "Energy")
    
    /// Temperature data type
    public static let Temperature = DataType(dataIdentifier: "Temperature")
    
    /// Humidity data type
    public static let Humidity = DataType(dataIdentifier: "Humidity")
    
    /// Natural light data type
    public static let NaturalLight = DataType(dataIdentifier: "Natural Light")
    
    /// Carbon dioxide data type
    public static let CarbonDioxide = DataType(dataIdentifier: "Carbon Dioxide")
    
    /// Particulate 2.5 matter data type
    public static let ParticulateMatter25 = DataType(dataIdentifier: "PM 2.5 particles")
    
    /// Particulate 10 matter data type
    public static let ParticulateMatter10 = DataType(dataIdentifier: "PM 10 particles")
    
    /// Noise data type
    public static let Noise = DataType(dataIdentifier: "Noise")
}

//MARK: Equatable implementation
extension DataType : Equatable {
}

public func == (lhs: DataType, rhs: DataType) -> Bool {
    return lhs.dataIdentifier == rhs.dataIdentifier
}

//MARK: Custom String Convertible implementation
extension DataType: CustomStringConvertible {
    public var description: String {
        return dataIdentifier
    }
}
