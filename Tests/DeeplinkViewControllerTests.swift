@testable import MarcoPolo
import XCTest

class DeeplinkViewControllerTests: XCTestCase {
  private let sut = MockViewController.self

  override class func setUp() {
    super.setUp()
    setUpApplication()
  }

  func testPositiveCanOpenURL() {
    let url = URL(string: "https://www.google.com.br/mock/testing/")!
    XCTAssert(sut.canOpenURL(url))
  }

  func testNegativeCanOpenURL() {
    let url = URL(string: "https://www.google.com.br/mock/testing/application")!
    XCTAssertFalse(sut.canOpenURL(url))
  }

  func testArguments() {
    let vc = sut.init()
    vc.arguments = "testing argument saving"
    XCTAssertEqual(vc.arguments, "testing argument saving")
  }
}
