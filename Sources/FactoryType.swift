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
    Strutures that adopt `FactoryType` protocol can be used to create network layer
    of the framework. It should work in conjuction with all other defined data types,
    and always return instances of protocol, rather instances of structures.
    
    All `FactoryType` structures should have a singleton access object named `sharedInstance`
*/
public protocol FactoryType {
    
    /// Returns singleton Factory object
    static var sharedInstance: Self { get }
}
