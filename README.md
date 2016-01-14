![https://img.shields.io/badge/platform-linux%20|%20osx%20|%20ios-blue.svg](https://img.shields.io/badge/platform-linux%20|%20osx%20|%20ios-blue.svg) [![Build Status](https://travis-ci.org/cityos/CoreCityOS.svg?branch=master)](https://travis-ci.org/cityos/CoreCityOS)

# CoreCityOS
Core iOS services used for building and shipping iOS applications

## Installation
1. [Linux](http://google.com)
2. [OS X](http://google.com)

### Linux installation
Install CoreCityOS by using [Swift Package Manager](https://github.com/apple/swift-package-manager).

```swift
import PackageDescription

let package = Package (
  name: "CityOS",
  dependencies: [
    .Package(url: "https://github.com/cityos/CoreCityOS.git", majorVersion: 1),
  ]
)
```

After dependency is added to the `Package.swift`, run `swift build` to compile the framework. After compiling use the import statement.

```swift
import CoreCityOS
```
### OS X installation
CoreCityOS can be installed on OS by using any of the following:
* Swift Package Manager
* Carthage
* Embedded framework

To install using Carthage add following  to the Cartfile:
```bash
github "cityos/CoreCityOS" ~> 0.0.1
```

