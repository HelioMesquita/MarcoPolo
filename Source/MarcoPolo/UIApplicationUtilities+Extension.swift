//
//  UIApplicationExtension.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 18/04/23.
//

import Foundation

public protocol UIApplicationProtocol {
  var arguments: Any? { get set }
  @discardableResult func open(_ url: URL, with arguments: Any?) -> Bool
}

extension UIApplication: UIApplicationProtocol {
  public var arguments: Any? {
    get {
      objc_getAssociatedObject(self, &AssociatedKeys.toggleState)
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  @discardableResult public func open(_ url: URL, with arguments: Any?) -> Bool {
    self.arguments = arguments
    return openURL(url)
  }
}

public class UIApplicationUtilities {
  public static var application: UIApplicationProtocol = UIApplication.shared

  static func open(_ url: URL, with arguments: Any?) {
    application.open(url, with: arguments)
  }
}
