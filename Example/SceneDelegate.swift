//
//  SceneDelegate.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

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
      os_log("Deeplink not found", log: OSLog.default, type: .error)
    }
  }

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    let window = UIWindow(windowScene: windowScene)

    coordinator.open(MainViewController.self, arguments: nil)
    window.rootViewController = coordinator.navigation

    self.window = window
    window.makeKeyAndVisible()
  }
}
