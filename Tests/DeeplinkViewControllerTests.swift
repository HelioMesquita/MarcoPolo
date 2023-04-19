@testable import MarcoPolo
import XCTest

class MockViewController: UIViewController, DeeplinkViewController {
  typealias DeeplinkParameterReceiveType = String

  static var path: String = "mock/testing"
}

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

  func testOpenDeeplink() {
    let vc = sut.init()
    vc.openDeeplink(path: "anything", arguments: "testing argument")
    XCTAssert(XCTestCase.customApplication.hasCalledOpen)
    XCTAssertEqual(XCTestCase.customApplication.arguments as! String, "testing argument")
  }

//  var arguments: DeeplinkParameterReceiveType? {
//    get {
//      return objc_getAssociatedObject(self, &AssociatedKeys.toggleState) as? DeeplinkParameterReceiveType ?? nil
//    }
//    set(newValue) {
//      objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//    }
//  }
//
//  static func canOpenURL(_ url: URL) -> Bool {
//    url.pages() == Self.path.split(separator: "/").map({ String($0) })
//  }
//
//  func openDeeplink(path: String, arguments: Any? = nil) {
}
