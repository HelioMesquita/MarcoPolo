//
//  Bundle+Extension.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 18/04/23.
//

import Foundation

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
