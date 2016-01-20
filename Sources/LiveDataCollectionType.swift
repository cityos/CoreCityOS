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
Structures that adopt `LiveCollectionDataType` protocol can be used to
represent arbitary collection of `LiveDataType` data readings. Since
each device can use different schema for its data points,
`LiveCollectionDataType` is used to create arbitary scheme definition.

Each structure that implements this protocol gets all subscript
implementations via protocol extensions.
*/
public protocol LiveDataCollectionType {
    
    /// Device data
    var deviceData : DeviceData { get set }
    
    /// Creation date
    var creationDate : NSDate { get set }
    
    /// All live data readings
    var allReadings : [LiveDataType] { get set }
}

extension LiveDataCollectionType {
    
    public subscript (type: DataType) -> LiveDataType? {
        return self.allReadings
            .filter { $0.type.dataIdentifier == type.dataIdentifier }
            .first
    }
    
    public subscript(jsonKey: String) -> LiveDataType? {
        return self.allReadings
            .filter { $0.jsonKey == jsonKey }
            .first
    }
}