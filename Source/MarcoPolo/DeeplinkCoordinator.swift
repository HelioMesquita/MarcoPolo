//
//  Coordinator.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

public protocol DeeplinkCoordinator {
  var viewControllers: [any DeeplinkViewController.Type] { get set }
  var coordinators: [DeeplinkCoordinator] { get set }
  var navigation: UINavigationController { get set }

  init(navigation: UINavigationController)

  func open(_ viewController: any DeeplinkViewController.Type, arguments: Any?)
  func handleURL(_ url: URL, arguments: Any?)
  func canOpenURL(_ url: URL) -> Bool
}

public extension DeeplinkCoordinator {
  func handleURL(_ url: URL, arguments: Any?) {
    if let viewController = viewControllers.first(where: { $0.canOpenURL(url) }) {
      open(viewController, arguments: arguments ?? url)
    } else if let coordinator = coordinators.first(where: { $0.canOpenURL(url) }) {
      coordinator.handleURL(url, arguments: arguments)
    }
  }

  func canOpenURL(_ url: URL) -> Bool {
    if viewControllers.first(where: { $0.canOpenURL(url) }) != nil {
      return true
    } else if coordinators.first(where: { $0.canOpenURL(url) }) != nil {
      return true
    }
    return false
  }
}
