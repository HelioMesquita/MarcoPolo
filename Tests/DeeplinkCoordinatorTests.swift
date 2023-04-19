@testable import MarcoPolo
import XCTest

class DeeplinkCoordinatorTests: XCTestCase {

  let sut = MockMainCoordinator(navigation: UINavigationController())
  var secondCoordinator: MockSecondCoordinator {
    sut.coordinators.first as! MockSecondCoordinator
  }

  var thirdCoordinator: MockThirdCoordinator {
    sut.coordinators.first?.coordinators.first as! MockThirdCoordinator
  }

  override class func setUp() {
    super.setUp()
    setUpApplication()
  }

  func testFirstValidCanOpenURL() {
    let url = URL(string: "https://www.google.com.br/main")!
    XCTAssert(sut.canOpenURL(url))
  }

  func testSecondValidCanOpenURL() {
    let url = URL(string: "https://www.google.com.br/second")!
    XCTAssert(sut.canOpenURL(url))
  }

  func testThirdValidCanOpenURL() {
    let url = URL(string: "https://www.google.com.br/third")!
    XCTAssert(sut.canOpenURL(url))
  }

  func testInvalidCanOpenURL() {
    let url = URL(string: "https://www.google.com.br/invalid")!
    XCTAssertFalse(sut.canOpenURL(url))
  }

  func testFirstHandleURL() {
    let url = URL(string: "https://www.google.com.br/main")!
    sut.handleURL(url, arguments: nil)
    XCTAssert(sut.hasCalledOpen)
    XCTAssertFalse(secondCoordinator.hasCalledOpen)
    XCTAssertFalse(thirdCoordinator.hasCalledOpen)
  }

  func testSecondHandleURL() {
    let url = URL(string: "https://www.google.com.br/second")!
    sut.handleURL(url, arguments: nil)
    XCTAssertFalse(sut.hasCalledOpen)
    XCTAssert(secondCoordinator.hasCalledOpen)
    XCTAssertFalse(thirdCoordinator.hasCalledOpen)
  }

  func testThirdHandleURL() {
    let url = URL(string: "https://www.google.com.br/third")!
    sut.handleURL(url, arguments: nil)
    XCTAssertFalse(sut.hasCalledOpen)
    XCTAssertFalse(secondCoordinator.hasCalledOpen)
    XCTAssert(thirdCoordinator.hasCalledOpen)
  }

  func testInvalidHandleURL() {
    let url = URL(string: "https://www.google.com.br/invalid")!
    sut.handleURL(url, arguments: nil)
    XCTAssertFalse(sut.hasCalledOpen)
    XCTAssertFalse(secondCoordinator.hasCalledOpen)
    XCTAssertFalse(sut.hasCalledOpen)
  }

}
