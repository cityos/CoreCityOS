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

import Foundation

/// Defines single data point value with timestamp
public struct DataPoint<T> {
    
    public typealias DataPointValue = T
    
    public let timestamp : NSDate
    public let value : DataPointValue
    
    /**
     Initializes data reading with value and time stamp
     
     - parameter value: Data reading value
     - parameter timeStamp NSDate value
     */
    public init(value: DataPointValue, timeStamp stamp: NSDate) {
        self.value = value
        self.timestamp = stamp
    }
    
    /**
     Initializes data reading with value and unix time stamp
     
     - parameter value: Data reading value
     - parameter timeStamp unix time stamp
     */
    public init(value: DataPointValue, unixTimeStamp stamp: NSTimeInterval) {
        self.value = value
        self.timestamp = NSDate(timeIntervalSince1970: stamp)
    }
    
    /**
     Initializes data reading with no data stamp. In that case
     timestamp is set to current device time
     
     - parameter value: Data reading value
     */
    public init(_ value: DataPointValue) {
        self.value = value
        self.timestamp = NSDate()
    }
}

//MARK: Equatable implementation
extension DataPoint : Equatable {
}


public func ==<T>(lhs: DataPoint<T>, rhs: DataPoint<T>) -> Bool {
    return lhs.value == rhs.value {
        return true
    }
}

//MARK: Custom String Convertible implementation
extension DataPoint : CustomStringConvertible {
    public var description : String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' h:mm a"
        let stamp = dateFormatter.stringFromDate(self.timestamp)
        return "[\(stamp) - \(self.value)]"
    }
}

//MARK: Comparable implementation
extension DataPoint : Comparable {}

public func <(lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value < rhs.value
}

public func <=(lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value <= rhs.value
}

public func >(lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value > rhs.value
}

public func >=(lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value >= rhs.value
}
