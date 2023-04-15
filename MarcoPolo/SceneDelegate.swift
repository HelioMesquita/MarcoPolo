//
//  SceneDelegate.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var coordinator: MainCoordinator?
  var window: UIWindow?

  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    guard let firstUrl = URLContexts.first?.url else {
      return
    }
    if coordinator?.canOpenURL(firstUrl) ?? false {
      coordinator?.handleURL(firstUrl)
    } else {
      fatalError("not found \(firstUrl)")
    }
  }

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let windowScene = (scene as? UIWindowScene) else { return }

    let window = UIWindow(windowScene: windowScene)

    let navController = UINavigationController()
    coordinator = MainCoordinator(navigation: navController)
    coordinator?.coordinators = [OnboardingCoordinator(navigation: navController)]
    coordinator?.open(MainViewController.self)

    window.rootViewController = navController

    self.window = window
    window.makeKeyAndVisible()
  }

}
