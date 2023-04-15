//
//  Coordinator.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

protocol DeeplinkCoordinator {
  var viewControllers: [DeeplinkViewController.Type] { get set }
  var coordinators: [DeeplinkCoordinator] { get set }
  var navigation: UINavigationController { get set }

  init(navigation: UINavigationController)

  func open(_ viewController: DeeplinkViewController.Type, arguments: Any?)
  func handleURL(_ url: URL, arguments: Any?)
  func canOpenURL(_ url: URL) -> Bool
}

extension DeeplinkCoordinator {

  func handleURL(_ url: URL, arguments: Any?) {
    if let viewController = viewControllers.first(where: { $0.canOpenURL(url) } ) {
      open(viewController, arguments: arguments)
    } else if let coordinator = coordinators.first(where: { $0.canOpenURL(url) } ) {
      coordinator.handleURL(url, arguments: arguments)
    }
  }

  func canOpenURL(_ url: URL) -> Bool {
    if viewControllers.first(where: { $0.canOpenURL(url) } ) != nil {
      return true
    } else if coordinators.first(where: { $0.canOpenURL(url) } ) != nil {
      return true
    }
    return false
  }

}

class MainCoordinator: DeeplinkCoordinator {

  var viewControllers: [DeeplinkViewController.Type] = [
    MainViewController.self
  ]
  lazy var coordinators: [DeeplinkCoordinator] = [
    OnboardingCoordinator(navigation: navigation)
  ]
  var navigation: UINavigationController

  required init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  func open(_ viewController: DeeplinkViewController.Type, arguments: Any?) {
    let vc = viewController.init()
    navigation.pushViewController(vc, animated: true)
  }

}

class OnboardingCoordinator: DeeplinkCoordinator {

  var viewControllers: [DeeplinkViewController.Type] = [
    OnboardingFirstViewController.self,
    OnboardingSecondViewController.self,
    OnboardingThirdViewController.self,
  ]
  var coordinators: [DeeplinkCoordinator] = []
  var navigation: UINavigationController

  required init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  func open(_ viewController: DeeplinkViewController.Type, arguments: Any?) {
    if viewController == OnboardingFirstViewController.self {
      openFirstScreen(true, arguments)
    } else if viewController == OnboardingSecondViewController.self {
      openSecondScreen(true, arguments)
    } else {
      openThirdScreen(true, arguments)
    }
  }

  func openFirstScreen(_ animated: Bool, _ arguments: Any?) {
    let vc = OnboardingFirstViewController()
    vc.arguments = arguments
    navigation.pushViewController(vc, animated: animated)
  }

  func openSecondScreen(_ animated: Bool, _ arguments: Any?) {
    if navigation.viewControllers.last is OnboardingFirstViewController {
      let vc = OnboardingSecondViewController()
      vc.arguments = arguments
      navigation.pushViewController(vc, animated: animated)
    } else {
      openFirstScreen(false, arguments)
      openSecondScreen(animated, arguments)
    }
  }

  func openThirdScreen(_ animated: Bool, _ arguments: Any?) {
    if navigation.viewControllers.last is OnboardingSecondViewController {
      let vc = OnboardingThirdViewController()
      vc.arguments = arguments
      navigation.pushViewController(vc, animated: animated)
    } else {
      openSecondScreen(false, arguments)
      openThirdScreen(animated, arguments)
    }
  }

}
