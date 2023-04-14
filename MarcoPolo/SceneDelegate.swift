//
//  SceneDelegate.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

extension URL {
  func pages() -> [String] {
    var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
    urlComponents?.queryItems = []

    var urlString = urlComponents?.url?.absoluteString ?? ""
    urlString.removeAll(where: { $0 == "?" })
    return urlString.split(separator: "/").dropFirst().map({ String($0) })
  }
}

protocol DeeplinkHandlerProtocol {
  var path: String { get set }
  func canOpenURL(_ url: URL) -> Bool
  func openURL(_ url: URL)
}

extension DeeplinkHandlerProtocol {
  func canOpenURL(_ url: URL) -> Bool {
    url.pages() == path.split(separator: "/").map( { String($0) })
  }
}


protocol DeeplinkCoordinatorProtocol {
  @discardableResult func handleURL(_ url: URL) -> Bool
}

final class AccountDeeplinkHandler: DeeplinkHandlerProtocol {

  var path: String = "account"

  private weak var rootViewController: UIViewController?
  init(rootViewController: UIViewController?) {
    self.rootViewController = rootViewController
  }

  func openURL(_ url: URL) {
    guard canOpenURL(url) else {
      return
    }

    // mock the navigation
    let viewController = UIViewController()
    viewController.title = "Account"
    viewController.view.backgroundColor = .yellow
    rootViewController?.present(viewController, animated: true)
  }
}


final class VideoDeeplinkHandler: DeeplinkHandlerProtocol {

  var path: String = "videos"

  private weak var rootViewController: UIViewController?
  init(rootViewController: UIViewController?) {
    self.rootViewController = rootViewController
  }

  // MARK: - DeeplinkHandlerProtocol
  func openURL(_ url: URL) {
    guard canOpenURL(url) else {
      return
    }

    // mock the navigation
    let viewController = UIViewController()
    switch url.path {
    case "/new":
      viewController.title = "Video Editing"
      viewController.view.backgroundColor = .orange
    default:
      viewController.title = "Video Listing"
      viewController.view.backgroundColor = .cyan
    }

    rootViewController?.present(viewController, animated: true)
  }
}

final class DeeplinkCoordinator: DeeplinkCoordinatorProtocol {

  let handlers: [DeeplinkHandlerProtocol]

  init(handlers: [DeeplinkHandlerProtocol]) {
    self.handlers = handlers
  }

  @discardableResult func handleURL(_ url: URL) -> Bool{
    guard let handler = handlers.first(where: { $0.canOpenURL(url) }) else {
      return false
    }

    handler.openURL(url)
    return true
  }
}


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  lazy var deeplinkCoordinator: DeeplinkCoordinatorProtocol = {
    return DeeplinkCoordinator(handlers: [
      AccountDeeplinkHandler(rootViewController: self.rootViewController),
      VideoDeeplinkHandler(rootViewController: self.rootViewController)
    ])
  }()

  var rootViewController: UIViewController? {
    return window?.rootViewController
  }

  func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
    guard let firstUrl = URLContexts.first?.url else {
      return
    }

    deeplinkCoordinator.handleURL(firstUrl)
  }


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let _ = (scene as? UIWindowScene) else { return }
  }


}

