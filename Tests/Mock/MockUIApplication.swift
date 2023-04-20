@testable import MarcoPolo
import XCTest

public class MockUIApplication: UIApplicationProtocol {
  public var hasCalledOpen = false
  public var arguments: Any?

  public func open(_ url: URL, with arguments: Any?) -> Bool {
    self.arguments = arguments
    hasCalledOpen = true
    return false
  }
}
