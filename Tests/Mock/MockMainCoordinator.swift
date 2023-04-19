@testable import MarcoPolo

class MockMainCoordinator: DeeplinkCoordinator {

  class MockMainViewController: UIViewController, DeeplinkViewController {
    typealias DeeplinkParameterReceiveType = String

    static var path: String = "main"
  }

  var viewControllers: [any DeeplinkViewController.Type] = [
    MockMainViewController.self
  ]
  lazy var coordinators: [DeeplinkCoordinator] = [
    MockSecondCoordinator(navigation: navigation)
  ]
  var navigation: UINavigationController
  var hasCalledOpen = false

  required init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  func open(_ viewController: any DeeplinkViewController.Type, arguments: Any?) {
    hasCalledOpen = true
  }
}

class MockSecondCoordinator: DeeplinkCoordinator {

  class MockSecondViewController: UIViewController, DeeplinkViewController {
    typealias DeeplinkParameterReceiveType = String

    static var path: String = "second"
  }

  var viewControllers: [any DeeplinkViewController.Type] = [
    MockSecondViewController.self
  ]
  lazy var coordinators: [DeeplinkCoordinator] = [
    MockThirdCoordinator(navigation: navigation)
  ]
  var navigation: UINavigationController
  var hasCalledOpen = false

  required init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  func open(_ viewController: any DeeplinkViewController.Type, arguments: Any?) {
    hasCalledOpen = true
  }
}

class MockThirdCoordinator: DeeplinkCoordinator {

  class MockThirdViewController: UIViewController, DeeplinkViewController {
    typealias DeeplinkParameterReceiveType = String

    static var path: String = "third"
  }

  var viewControllers: [any DeeplinkViewController.Type] = [
    MockThirdViewController.self
  ]
  lazy var coordinators: [DeeplinkCoordinator] = [
  ]
  var navigation: UINavigationController
  var hasCalledOpen = false

  required init(navigation: UINavigationController) {
    self.navigation = navigation
  }

  func open(_ viewController: any DeeplinkViewController.Type, arguments: Any?) {
    hasCalledOpen = true
  }
}
