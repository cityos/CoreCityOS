import Foundation

public struct DataPoint {
    
    public let timestamp : NSDate
    public let value : Double
    
    /**
     Initializes data reading with value and time stamp
     
     - parameter value: Data reading value
     - parameter timeStamp NSDate value
     */
    public init(value: Double, timeStamp stamp: NSDate) {
        self.value = value
        self.timestamp = stamp
    }
    
    /**
     Initializes data reading with value and unix time stamp
     
     - parameter value: Data reading value
     - parameter timeStamp unix time stamp
     */
    public init(value: Double, unixTimeStamp stamp: NSTimeInterval) {
        self.value = value
        self.timestamp = NSDate(timeIntervalSince1970: stamp)
    }
    
    /**
     Initializes data reading with no data stamp. In that case
     timestamp is set to current device time
     
     - parameter value: Data reading value
     */
    public init(_ value: Double) {
        self.value = value
        self.timestamp = NSDate()
    }
}

//MARK: - Equatable implementation
extension DataPoint : Equatable {
}

public func ==(lhs: DataPoint, rhs: DataPoint) -> Bool {
    return lhs.value == rhs.value
}

//MARK: - Custom String Convertible implementation
extension DataPoint : CustomStringConvertible {
    public var description : String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd 'at' h:mm a"
        let stamp = dateFormatter.stringFromDate(self.timestamp)
        return "[\(stamp) - \(self.value)]"
    }
}

//MARK: - IntegerLiteral Convertible implementation
extension DataPoint : IntegerLiteralConvertible {
    public init(integerLiteral value: Int) {
        self.value = Double(value)
        self.timestamp = NSDate()
    }
}

//MARK: - FloatLiteralConvertible implementation
extension DataPoint : FloatLiteralConvertible {
    public init(floatLiteral value: Double) {
        self.value = value
        self.timestamp = NSDate()
    }
}

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