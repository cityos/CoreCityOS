<img src="http://i.imgur.com/wkQEhiu.png" width="300px" height="100px"/>

![https://img.shields.io/badge/platform-linux%20|%20osx%20|%20ios-blue.svg](https://img.shields.io/badge/platform-linux%20|%20osx%20|%20ios-blue.svg) [![Build Status](https://travis-ci.org/cityos/CoreCityOS.svg?branch=master)](https://travis-ci.org/cityos/CoreCityOS)

CoreCityOS framework is designed as an CityOS open-source data format standard in the new IOT world. 

## Contents:
1. [Installation](#installation)
2. [Usage](#usage)
3. [Contributing](#contributing)
4. [Licence](#licence)

## Installation
1. [Swift Package Manager](http://google.com)
2. [Carthage](http://google.com)
3. [Embedded Framework]()

### Swift Package Manager
[Swift Package Manager](https://github.com/apple/swift-package-manager) is currently only available for OSX and Linux apps. To build CoreCityOS with Swift Package Manager add it like dependency inside your `Package.swift` file:

```swift
import PackageDescription

// Example Package.swift file
let package = Package (
  name: "CityOS",
  dependencies: [
    .Package(url: "https://github.com/cityos/CoreCityOS.git", majorVersion: 1),
  ]
)
```

After dependency is added to the `Package.swift`, run following to compile and build the framework:
```bash
$ swift build
```
### Carthage
You can use [Carthage](https://github.com/Carthage/Carthage) to install `CoreCityOS` by adding following to your `Cartfile`:
```bash
github "cityos/CoreCityOS" ~> 0.0.1
```
After that run following to build framework:
```bash
$ carthage update
```
> Note that you can pass `--platform` option to the `carthage`, if you want to build framework only for one platform. Supported Carthage platforms are iOS, OSX and tvOS.

### Manual installation
First add CoreCityOS to your project root folder as a submodule
```bash
$ git submodule add https://github.com/cityos/CoreCityOS.git
```
After that drag `CoreCityOS.xcodeproj` to your project and add it to **Linked Frameworks and Libraries** in your target settings.

## Usage
After you have added CoreCityOS by any of the supported methods you can import it with import statement:
```swift
import CoreCityOS
```
