//
//  MainCoordinator.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 15/04/23.
//

import UIKit
import MarcoPolo

class MainCoordinator: DeeplinkCoordinator {
  var viewControllers: [any DeeplinkViewController.Type] = [
    MainViewController.self
  ]
  lazy var coordinators: [DeeplinkCoordinator] = [
    OnboardingCoordinator(navigation: navigation)
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
