[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)
[![CocoaPods Compatible](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)](https://img.shields.io/badge/Cocoapods-compatible-orange?style=flat-square)  

# MarcoPolo
<br />
<p align="center">
  <a href="https://github.com/HelioMesquita/MarcoPolo/blob/main/images/marcopolo.png">
  <img src="https://github.com/HelioMesquita/MarcoPolo/blob/main/images/marcopolo.png?raw=true" alt="Swiftmazing Logo" width="200" height="200">
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

Before you starting using MarcoPolo you must configure some URLScheme to allow the deep-liking work.

First follow those steps in image. You can choose the name that you want.

<a href="https://miro.medium.com/v2/resize:fit:4800/format:webp/1*2wMikUaE4EEZFr3MABGaiQ.png">
  <img src="https://miro.medium.com/v2/resize:fit:4800/format:webp/1*2wMikUaE4EEZFr3MABGaiQ.png" alt="Swiftmazing Logo">
  </a>

After configuring the deep-linking, you must create the main/principal coordinator to hold all features and implement it in your app delegate or scene delegate.

```swift
import MarcoPolo
import UIKit

class MainCoordinator: DeeplinkCoordinator {
  var viewControllers: [any DeeplinkViewController.Type] = [
    ViewController.self // First view controller when opens the app
  ]
  lazy var coordinators: [DeeplinkCoordinator] = [
    // All your features coordinators here
  ]
  var navigation: UINavigationController

  required init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  func open(_ viewController: any DeeplinkViewController.Type, arguments: Any?) {
    let vc = viewController.init()
    navigation.pushViewController(vc, animated: true)
  }
}
```

Your view controller will appear like this

```swift
import MarcoPolo
import UIKit

class ViewController: UIViewController, DeeplinkViewController, DeeplinkOpener {
  typealias DeeplinkParameterReceiveType = String //Type of argument that deep-link will add in your class

  static var path: String = "main" // Deep-link path to find your class
}
```

### Using SceneDelegate

```swift
import OSLog
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var coordinator = MainCoordinator(navigation: UINavigationController())
  var window: UIWindow?

  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    guard let firstUrl = URLContexts.first?.url else {
      return
    }
    if coordinator.canOpenURL(firstUrl) {
      coordinator.handleURL(firstUrl, arguments: UIApplication.shared.arguments)
    } else {
      os_log("Not found deeplink", log: OSLog.default, type: .error)
    }
  }

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    let window = UIWindow(windowScene: windowScene)

    coordinator.open(ViewController.self, arguments: nil)
    window.rootViewController = coordinator.navigation

    self.window = window
    window.makeKeyAndVisible()
  }
}
```

### Using AppDelegate

```swift
import OSLog
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var coordinator = MainCoordinator(navigation: UINavigationController())
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    coordinator.open(ViewController.self, arguments: nil)
    window.rootViewController = coordinator.navigation
    self.window = window
    window.makeKeyAndVisible()
    return true
  }

  func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    if coordinator.canOpenURL(url) {
      coordinator.handleURL(url, arguments: UIApplication.shared.arguments)
      return true
    } else {
      os_log("Not found deeplink", log: OSLog.default, type: .error)
      return false
    }
}
```

Now everything is set up and you are ready to go

Just dont forget to add your new screen in the coordinator 😅

## Contribute

We would love you for the contribution to **MarcoPolo**, check the ``LICENSE`` file for more info.

[https://github.com/HelioMesquita/MarcoPolo](https://github.com/HelioMesquita)

[swift-image]:https://img.shields.io/badge/swift-5.X-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE