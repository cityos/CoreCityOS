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

public struct LiveData<T: Equatable, Comparable> : LiveDataType {
    public typealias DataPointType = T
    
    public var jsonKey : String
    public var type : DataType
    public var unitNotation : String
    public var dataPoints = [DataPoint<DataPointType>]()
}