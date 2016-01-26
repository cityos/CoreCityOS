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

public struct LiveData: LiveDataType {
    
    public var jsonKey: String
    public var type: DataType
    public var unitNotation: String
    public var dataPoints = [DataPoint]()
    
    public init(dataType type: DataType, jsonKey key: String, unitNotation notation: String) {
        self.jsonKey = key
        self.unitNotation = notation
        self.type = type
    }
}
