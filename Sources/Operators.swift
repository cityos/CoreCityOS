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

//MARK: DataPoint

extension DataPoint : Equatable, Comparable {
}

public func == (lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value == rhs.value
}

public func < (lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value < rhs.value
}

public func <= (lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value <= rhs.value
}

public func > (lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value > rhs.value
}

public func >= (lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value < rhs.value
}

//MARK: DeviceType

extension DataType : Equatable {
}

public func == (lhs: DataType, rhs: DataType) -> Bool {
    return lhs.dataIdentifier == rhs.dataIdentifier
}
