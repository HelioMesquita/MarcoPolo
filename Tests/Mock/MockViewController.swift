@testable import MarcoPolo
import UIKit

class MockViewController: UIViewController, DeeplinkViewController {
  typealias DeeplinkParameterReceiveType = String

  static var path: String = "mock/testing"
}
