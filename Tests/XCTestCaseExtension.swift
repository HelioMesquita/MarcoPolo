@testable import MarcoPolo
import XCTest

internal extension XCTestCase {
  internal static let customApplication = MockUIApplication()
  internal static let urlSchemes: [[String: Any]] = [["CFBundleURLName": "com.helio.testApplication",
                                            "CFBundleTypeRole": "Editor",
                                            "CFBundleURLSchemes": ["testeApplication"]]]

  class func setUpApplication() {
    BundleUtilities.bundleMainInfoDictionary = [
      BundleInfoDictionary.keyCFBundleURLTypes.rawValue: XCTestCase.urlSchemes
    ]
    UIApplicationUtilities.application = XCTestCase.customApplication
  }
}
