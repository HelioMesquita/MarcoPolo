//
//  OnboardingCoordinator.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 15/04/23.
//

import MarcoPolo
import UIKit

class OnboardingCoordinator: DeeplinkCoordinator {
  var viewControllers: [any DeeplinkViewController.Type] = [
    OnboardingFirstViewController.self,
    OnboardingSecondViewController.self,
    OnboardingThirdViewController.self
  ]
  var coordinators: [DeeplinkCoordinator] = []
  var navigation: UINavigationController

  required init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  func open(_ viewController: any DeeplinkViewController.Type, arguments: Any?) {
    if viewController == OnboardingFirstViewController.self {
      openFirstScreen(true, arguments)
    } else if viewController == OnboardingSecondViewController.self {
      openSecondScreen(true, arguments)
    } else {
      openThirdScreen(true, arguments)
    }
  }

  private func openFirstScreen(_ animated: Bool, _ arguments: Any?) {
    let vc = OnboardingFirstViewController()
    vc.arguments = arguments as? OnboardingFirstViewController.DeeplinkParameterReceiveType
    navigation.pushViewController(vc, animated: animated)
  }

  private func openSecondScreen(_ animated: Bool, _ arguments: Any?) {
    if navigation.viewControllers.last is OnboardingFirstViewController {
      let vc = OnboardingSecondViewController()
      vc.arguments = arguments as? OnboardingSecondViewController.DeeplinkParameterReceiveType
      navigation.pushViewController(vc, animated: animated)
    } else {
      openFirstScreen(false, arguments)
      openSecondScreen(animated, arguments)
    }
  }

  private func openThirdScreen(_ animated: Bool, _ arguments: Any?) {
    if navigation.viewControllers.last is OnboardingSecondViewController {
      let vc = OnboardingThirdViewController()
      vc.arguments = arguments as? OnboardingThirdViewController.DeeplinkParameterReceiveType
      navigation.pushViewController(vc, animated: animated)
    } else {
      openSecondScreen(false, arguments)
      openThirdScreen(animated, arguments)
    }
  }
}
