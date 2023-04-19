[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)  

# MarcoPolo
<br />
<p align="center">
  <a href="https://github.com/HelioMesquita/MarcoPolo/blob/master/images/marcopolo.jpeg">
    <img src="logo.jpeg" alt="Logo" width="80" height="80">
  </a>
  <p align="center">
    MarcoPolo combines coordinator and internal deep linking in a unique solution.
  </p>
</p>

## Propose to solve

Developing a scalable solution is a problem, especially when it becomes modular. One reason is that the way the iOS system manages navigation is very limited.

To workaround this limitation, We can use the coordinator pattern. This pattern handles all screen navigation and is typically used with MVVM, creating the famous MVVM-C. 

The coordinator pattern solves the problem for middle and small applications, but it gets messy when the app gets too big. The standard solution to this problem is creating a coordinator for each feature and having a primary coordinator take all of them. But when We decide to use multiple coordinators is the step to start a modular application. 

The modular solution works well until we get some needs like feature A open feature B and feature B open feature A. Then, we could import feature B into feature A and solve this problem, but this is not true because we can not have cyclic dependence. To fix this problem, We can use internal deep-link to handle the next screen without creating dependencies between modules, avoiding dependency hell and cycle dependency.

This library implements both patterns in a straightforward way 

## Features

- [x] Coordinator
- [x] Deep-linking using url scheme

## Requirements

- iOS 10.0+
- Xcode 14.2+

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `MarcoPolo` by adding it to your `Podfile`:

```ruby
platform :ios, '10.0'
use_frameworks!
pod 'MarcoPolo'
```

## How to use

<!-- ```swift
import EZSwiftExtensions
ez.detectScreenShot { () -> () in
    print("User took a screen shot")
}
``` -->

## Contribute

We would love you for the contribution to **MarcoPolo**, check the ``LICENSE`` file for more info.

[https://github.com/HelioMesquita/MarcoPolo](https://github.com/HelioMesquita)

[swift-image]:https://img.shields.io/badge/swift-5.X-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE