//
//  Bundle+Extension.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 18/04/23.
//

import Foundation

public enum BundleInfoDictionary: String {
  case keyCFBundleURLTypes = "CFBundleURLTypes"
  case keyCFBundleURLSchemes = "CFBundleURLSchemes"
}

public class BundleUtilities {
  public static var bundleMainInfoDictionary: [String: Any]? = Bundle.main.infoDictionary

  public static func externalURLSchemes() -> [String] {
    guard let urlTypes = bundleMainInfoDictionary?["CFBundleURLTypes"] as? [[String: Any]] else {
      return []
    }

    var result: [String] = []
    for urlTypeDictionary in urlTypes {
      guard let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [String] else { continue }
      guard let externalURLScheme = urlSchemes.first else { continue }
      result.append(externalURLScheme)
    }

    return result
  }
}
