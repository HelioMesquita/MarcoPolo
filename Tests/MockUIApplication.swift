@testable import MarcoPolo
import XCTest

class MockUIApplication: UIApplicationProtocol {

  var hasCalledOpen = false
  var arguments: Any?

  func open(_ url: URL, with arguments: Any?) -> Bool {
    self.arguments = arguments
    hasCalledOpen = true
    return false
  }

}
