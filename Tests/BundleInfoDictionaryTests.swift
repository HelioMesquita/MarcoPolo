@testable import MarcoPolo
import XCTest

class BundleInfoDictionaryTests: XCTestCase {
  func testKeys() {
    XCTAssertEqual(BundleInfoDictionary.keyCFBundleURLTypes.rawValue, "CFBundleURLTypes")
    XCTAssertEqual(BundleInfoDictionary.keyCFBundleURLSchemes.rawValue, "CFBundleURLSchemes")
  }
}
