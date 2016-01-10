![https://img.shields.io/badge/platform-linux%20|%20osx%20|%20ios-blue.svg](https://img.shields.io/badge/platform-linux%20|%20osx%20|%20ios-blue.svg)

# CoreCityOS
Core iOS services used for building and shipping iOS applications

## Installation
Install CoreCityOS by using [Swift Package Manager](https://github.com/apple/swift-package-manager).

```swift
import PackageDescription

let package = Package (
  name: "CityOS",
  dependencies: [
    .Package(url: "https://github.com/cityos/core-ios.git", majorVersion: 1),
  ]
)
```

After dependency is added to the `Package.swift`, run `swift build` to compile the framework. After compiling use the import statement.

```swift
import CoreCityOS
```
