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

  func open(_ viewController: DeeplinkViewController.Type)
  func handleURL(_ url: URL)
  func canOpenURL(_ url: URL) -> Bool
}

extension DeeplinkCoordinator {

  func handleURL(_ url: URL) {
    if let viewController = viewControllers.first(where: { $0.canOpenURL(url) } ) {
      open(viewController)
    } else if let coordinator = coordinators.first(where: { $0.canOpenURL(url) } ) {
      coordinator.handleURL(url)
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

  func open(_ viewController: DeeplinkViewController.Type) {
    let vc = viewController.init()
    navigation.pushViewController(vc, animated: true)
  }

}

class MainCoordinator: DeeplinkCoordinator {

  var viewControllers: [DeeplinkViewController.Type] = [
    MainViewController.self
  ]
  var coordinators: [DeeplinkCoordinator] = []
  var navigation: UINavigationController

  required init(navigation: UINavigationController) {
    self.navigation = navigation
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

  func open(_ viewController: DeeplinkViewController.Type) {
    if viewController == OnboardingFirstViewController.self {
      openFirstScreen(true)
    } else if viewController == OnboardingSecondViewController.self {
      openSecondScreen(true)
    } else {
      openThirdScreen(true)
    }
  }

  func openFirstScreen(_ animated: Bool) {
    let vc = OnboardingFirstViewController()
    navigation.pushViewController(vc, animated: animated)
  }

  func openSecondScreen(_ animated: Bool) {
    if navigation.viewControllers.last is OnboardingFirstViewController {
      let vc = OnboardingSecondViewController()
      navigation.pushViewController(vc, animated: animated)
    } else {
      openFirstScreen(false)
      openSecondScreen(animated)
    }
  }

  func openThirdScreen(_ animated: Bool) {
    if navigation.viewControllers.last is OnboardingSecondViewController {
      let vc = OnboardingThirdViewController()
      navigation.pushViewController(vc, animated: animated)
    } else {
      openSecondScreen(false)
      openThirdScreen(animated)
    }
  }

}
