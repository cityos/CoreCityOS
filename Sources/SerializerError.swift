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
    Defines errors that can be thrown in Serializer class.
*/
public enum SerializerError: ErrorType {
    
    /**
        This error is thrown when invalid data is parsed.
     */
    case InvalidDataParsed(message: String)
    
    /**
     This error is thrown when some parameter is missing from the json body retrieved
     from the backend.
     */
    case MissingParameter(parameter: String)
    
    /**
     This error is thrown when there is no location data retrieved.
     */
    case LocationDataNotSet
}
