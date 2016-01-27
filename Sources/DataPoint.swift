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
import class Foundation.NSDate
import class Foundation.NSDateFormatter
import typealias Foundation.NSTimeInterval

/**
    Single arbitary immutable data point with timestamp information. Data points act as a
    data model inside `LiveDataType`. `DataPoint` can be initalized with value only, in which
    case timestamp is set to the current device system timestamp.
 
    `DataPoint` structures adopt `Equatable` and `Comparable` protocols.
*/
public struct DataPoint {
    
    public typealias DataPointValue = Double
    
    /// Data point reation date timestamp
    public let timestamp: NSDate
    
    /// Data reading value
    public var value: Double
    
    /**
     Initializes data reading with value and time stamp
     
     - parameter value: Data reading value
     - parameter timeStamp: NSDate value
     */
    public init(value: DataPointValue, timeStamp stamp: NSDate) {
        self.value = value
        self.timestamp = stamp
    }
    
    /**
     Initializes data reading with value and unix time stamp
     
     - parameter value: Data reading value
     - parameter timeStamp: unix time stamp
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
    public init(value: DataPointValue) {
        self.value = value
        self.timestamp = NSDate()
    }
}


//MARK: Custom String Convertible implementation
extension DataPoint : CustomStringConvertible {
    
    static var dateFormatter: NSDateFormatter {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' h:mm a"
        return dateFormatter
    }
    
    /**
        Returns textual representation of `self`.
    */
    public var description: String {
        return self.value.description
    }
}

//MARK: Custom Debug String Convertible implementation
extension DataPoint : CustomDebugStringConvertible {
    
    /**
        Returns textual representation of `self` with timestamp data in form:
     
        ```
        [26.1.2016 at 23:00 = 24]
        ```
    */
    public var debugDescription: String {
        let stamp = DataPoint.dateFormatter.stringFromDate(self.timestamp)
        return "[\(stamp) = \(self.value)]"
    }
}

//MARK: Equatable and Comparable implementation
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
