@testable import MarcoPolo
import XCTest

class BundleUtilitiesTests: XCTestCase {

  static let urlSchemes: [[String: Any]] = [["CFBundleURLName": "com.helio.MarcoPolo",
                                            "CFBundleTypeRole": "Editor",
                                            "CFBundleURLSchemes": ["marcopolo"]]]

  override class func setUp() {
    super.setUp()
    BundleUtilities.bundleMainInfoDictionary = [
      BundleInfoDictionary.keyCFBundleURLTypes.rawValue: urlSchemes
    ]
  }

  func testGetExternalURLSchemes() {
    XCTAssertEqual(BundleUtilities.externalURLSchemes(), ["marcopolo"])
  }

}
