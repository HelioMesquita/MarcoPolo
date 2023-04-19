//
//  DeeplinkViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

public protocol DeeplinkViewController: UIViewController {
  associatedtype DeeplinkParameterReceiveType
  var arguments: DeeplinkParameterReceiveType? { get set }
  static var path: String { get set }
  static func canOpenURL(_ url: URL) -> Bool

  func openDeeplink(path: String, arguments: Any?)
}

public extension DeeplinkViewController {
  var arguments: DeeplinkParameterReceiveType? {
    get {
      objc_getAssociatedObject(self, &AssociatedKeys.toggleState) as? DeeplinkParameterReceiveType
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  static func canOpenURL(_ url: URL) -> Bool {
    url.pages() == Self.path.split(separator: "/").map({ String($0) })
  }

  func openDeeplink(path: String, arguments: Any? = nil) {
    guard let urlScheme = BundleUtilities.externalURLSchemes().first,
          let url = URL(string: urlScheme + "://" + path) else {
      return
    }

    UIApplicationUtilities.open(url, with: arguments)
  }
}

struct AssociatedKeys {
  static var toggleState: UInt8 = 0
}
