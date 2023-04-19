//
//  URL+Extension.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 18/04/23.
//

import Foundation

extension URL {
  func pages() -> [String] {
    var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)
    urlComponents?.queryItems = []
    urlComponents?.scheme = nil

    var urlString = urlComponents?.url?.absoluteString ?? ""
    urlString.removeAll(where: { $0 == "?" })
    return urlString.split(separator: "/").dropFirst().map({ String($0) })
  }
}
