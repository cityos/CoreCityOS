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
    Structures conforming live data type can be used to represent live data.

    To see example implementation of this protocol refer to the `LiveData`
*/
public protocol LiveDataType {
    
    /// JSON key under which data value is stored
    var jsonKey: String { get }
    
    /// Data type with identifier, for example Temperature or Humidity
    var type: DataType { get }
    
    /// Unit identifier, for example % or MpH
    var unitNotation: String { get }
    
    /// Holds all readings for data type
    var dataPoints: [DataPoint] { get set }
}

extension LiveDataType {
    
    /// Returns current data point from the `dataPoints` array.
    /// The newest data point is always the first element in the array
    public var currentDataPoint: DataPoint? {
        return dataPoints.first
    }
    
    /// Insert data point to the `dataPoints` array at index 0.
    public mutating func addDataPoint(point: DataPoint) {
        dataPoints.insert(point, atIndex: 0)
    }
}

extension LiveDataType {
    /// Returns full data specifier with value and unit notation, for ex. 3 Mhw
    public func fullDataReadingSpecifier() -> String {
        return "\(self.currentDataPoint) \(self.unitNotation)"
    }
}
