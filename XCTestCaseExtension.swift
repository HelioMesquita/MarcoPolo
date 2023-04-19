@testable import MarcoPolo
import XCTest

extension XCTestCase {

  static let customApplication = MockUIApplication()
  static let urlSchemes: [[String: Any]] = [["CFBundleURLName": "com.helio.testApplication",
                                            "CFBundleTypeRole": "Editor",
                                            "CFBundleURLSchemes": ["testeApplication"]]]

  class func setUpApplication() {
    BundleUtilities.bundleMainInfoDictionary = [
      BundleInfoDictionary.keyCFBundleURLTypes.rawValue: XCTestCase.urlSchemes
    ]
    UIApplicationUtilities.application = XCTestCase.customApplication
  }

}
