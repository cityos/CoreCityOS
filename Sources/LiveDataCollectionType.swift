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
    Structures that adopt `LiveDataCollectionType` protocol can be used to
    represent arbitary collection of `LiveDataType` data readings. Since
    each device can use different schema for its data points,
    `LiveDataCollectionType` is used to create arbitary scheme definition.

    Each structure that implements this protocol gets all subscript
    implementations via protocol extensions.

    Example protocol implementation:

    ```swift
    class TestDataCollection: LiveDataCollectionType {
        var deviceData = DeviceData(deviceID: "test-device")
        var creationDate = NSDate()
        var allReadings = [LiveDataType]()

        var temperature: LiveDataType {
            return LiveData(
            dataType: .Temperature,
            jsonKey: "temp",
            unitNotation: "C"
            )
        }

        var noise: LiveDataType {
            return LiveData(
            dataType: .Noise,
            jsonKey: "noise",
            unitNotation: "dB"
            )
        }

        init() {
            self.allReadings = [
                temperature,
                noise
            ]
        }
    }

    ```

    Once you define conforming structure, you can initialize it like following:

    ```swift
    let collection = TestDataCollection()
    ```
*/
public protocol LiveDataCollectionType {
    
    /// Device data
    var deviceData: DeviceData { get set }
    
    /// Creation date
    var creationDate: NSDate { get set }
    
    /// All live data readings
    var allReadings: [LiveDataType] { get set }
}

//MARK: Subscript extensions
extension LiveDataCollectionType {
    
    public subscript (type: DataType) -> LiveDataType? {
        get {
            return self.allReadings
                .filter { $0.type.dataIdentifier == type.dataIdentifier }
                .first
        }
        
        set {
            let index = self.allReadings.indexOf { $0.type.dataIdentifier == type.dataIdentifier }
            if let index = index {
                self.allReadings[index] = newValue!
            }
        }
    }
    
    public subscript(jsonKey: String) -> LiveDataType? {
        get {
            return self.allReadings
                .filter { $0.jsonKey == jsonKey }
                .first
        }
        
        set {
            let index = self.allReadings.indexOf { $0.jsonKey == jsonKey }
            if let index = index {
                self.allReadings[index] = newValue!
            }
        }
    }
}
