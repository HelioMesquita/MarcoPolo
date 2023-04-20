//
//  DeeplinkOpener.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 19/04/23.
//

import Foundation

public protocol DeeplinkOpener {
  func openDeeplink(path: String, arguments: Any?)
}

public extension DeeplinkOpener {
  func openDeeplink(path: String, arguments: Any? = nil) {
    guard let urlScheme = BundleUtilities.externalURLSchemes().first,
          let url = URL(string: urlScheme + "://" + path) else {
      return
    }

    UIApplicationUtilities.open(url, with: arguments)
  }
}
