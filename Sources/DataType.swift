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

/**
 Data type structure is used to define types of data that devices are capable
 of reading. `DataType` is by default packed with some types that are:
 * Energy
 * Temperature
 * Humidity
 * NaturalLight
 * CarbonDioxide
 * ParticleMeter
 * Noise
 
 Additional data types can be defined via extension of DataType like:
 ```
 extension DataType {
    static let AirPressure = DataType(dataIdentifier: "Air Pressure")
 }
 ```
*/
public struct DataType {
    public let dataIdentifier : String
    
    /// Use dataIdetifier object for the human like data type definition
    /// such as Temperature or Carbon Dioxide
    public init(dataIdentifier identifier : String) {
        self.dataIdentifier = identifier
    }
    
    public static let Energy = DataType(dataIdentifier: "Energy")
    public static let Temperature = DataType(dataIdentifier: "Temperature")
    public static let Humidity = DataType(dataIdentifier: "Humidity")
    public static let NaturalLight = DataType(dataIdentifier: "Natural Light")
    public static let CarbonDioxide = DataType(dataIdentifier: "Carbon Dioxide")
    public static let ParticleMatter25 = DataType(dataIdentifier: "PM 2.5 particles")
    public static let ParticleMatter10 = DataType(dataIdentifier: "PM 10 particles")
    public static let Noise = DataType(dataIdentifier: "Noise")
}

extension DataType : Equatable {
}

public func ==(lhs: DataType, rhs: DataType) -> Bool {
    return lhs.dataIdentifier == rhs.dataIdentifier
}
