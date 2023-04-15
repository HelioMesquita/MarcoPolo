//
//  DeeplinkProtocol.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

protocol DeeplinkViewController: UIViewController {
  var arguments: Any? { get set }
  static var path: String { get set }
  static func canOpenURL(_ url: URL) -> Bool

  func openDeeplink(path: String, arguments: Any?)
}

extension DeeplinkViewController {

  var arguments: Any? {
    get {
      guard let value = objc_getAssociatedObject(self, &AssociatedKeys.toggleState) else {
        return nil
      }
      return value
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

  static func canOpenURL(_ url: URL) -> Bool {
    url.pages() == Self.path.split(separator: "/").map( { String($0) })
  }

  func openDeeplink(path: String, arguments: Any? = nil) {
    guard let urlScheme = Bundle.externalURLSchemes.first,
          let url = URL(string: urlScheme + "://" + path) else {
      return
    }

    UIApplication.shared.arguments = arguments
    UIApplication.shared.open(url)
  }

}

struct AssociatedKeys {
  static var toggleState: UInt8 = 0
}

extension UIApplication {

  var arguments: Any? {
    get {
      guard let value = objc_getAssociatedObject(self, &AssociatedKeys.toggleState) else {
        return nil
      }
      return value
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }

}

extension Bundle {

  static let externalURLSchemes: [String] = {
    guard let urlTypes = main.infoDictionary?["CFBundleURLTypes"] as? [[String: Any]] else {
      return []
    }

    var result: [String] = []
    for urlTypeDictionary in urlTypes {
      guard let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [String] else { continue }
      guard let externalURLScheme = urlSchemes.first else { continue }
      result.append(externalURLScheme)
    }

    return result
  }()

}

extension URL {
  func pages() -> [String] {
    var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
    urlComponents?.queryItems = []

    var urlString = urlComponents?.url?.absoluteString ?? ""
    urlString.removeAll(where: { $0 == "?" })
    return urlString.split(separator: "/").dropFirst().map({ String($0) })
  }
}

