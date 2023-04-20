@testable import MarcoPolo
import XCTest

class DeeplinkOpenerTests: XCTestCase {
  private class MockDeeplinkOpener: DeeplinkOpener {
  }

  private let sut = MockDeeplinkOpener()

  override class func setUp() {
    super.setUp()
    setUpApplication()
  }

  func testOpenDeeplink() {
    sut.openDeeplink(path: "anything", arguments: "testing argument")
    XCTAssert(XCTestCase.customApplication.hasCalledOpen)
    XCTAssertEqual(XCTestCase.customApplication.arguments as! String, "testing argument")
  }
}
