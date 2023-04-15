//
//  DeeplinkProtocol.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import Foundation
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

protocol DeeplinkViewController: UIViewController {
  static var path: String { get set }
  static func canOpenURL(_ url: URL) -> Bool

  init()
}

extension DeeplinkViewController {
  static func canOpenURL(_ url: URL) -> Bool {
    url.pages() == Self.path.split(separator: "/").map( { String($0) })
  }
}
