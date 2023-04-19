@testable import MarcoPolo
import XCTest

class BundleInfoDictionaryTests: XCTestCase {
  func testKeys() {
    XCTAssertEqual(BundleInfoDictionary.keyCFBundleURLTypes.rawValue, "CFBundleShortVersionString")
    XCTAssertEqual(BundleInfoDictionary.keyCFBundleURLSchemes.rawValue, "CFBundleVersion")
  }
}
