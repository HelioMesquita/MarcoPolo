@testable import MarcoPolo
import XCTest

class BundleUtilitiesTests: XCTestCase {
  override class func setUp() {
    super.setUp()
    setUpApplication()
  }

  func testGetExternalURLSchemes() {
    XCTAssertEqual(BundleUtilities.externalURLSchemes(), ["testeApplication"])
  }
}
