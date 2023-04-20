//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by Hélio Mesquita on 19/04/23.
//

@testable import Example

import MarcoPolo
import XCTest

final class ExampleTests: XCTestCase {
    private class MockUIApplication: UIApplicationProtocol {
      var hasCalledOpen = false
      var arguments: Any?
        var url: URL?

      func open(_ url: URL, with arguments: Any?) -> Bool {
        self.arguments = arguments
          self.url = url
        hasCalledOpen = true
        return false
      }
    }

    private static let customApplication = MockUIApplication()
    private static let urlSchemes: [[String: Any]] = [["CFBundleURLName": "com.helio.testApplication",
                                              "CFBundleTypeRole": "Editor",
                                              "CFBundleURLSchemes": ["testeApplication"]]]

    override class func setUp() {
      super.setUp()
        BundleUtilities.bundleMainInfoDictionary = [
          BundleInfoDictionary.keyCFBundleURLTypes.rawValue: Self.urlSchemes
        ]
        UIApplicationUtilities.application = Self.customApplication
    }

    func testExample() throws {
        let vc = OnboardingFirstViewController()
        vc.viewDidLoad()
        let button = vc.stackView.subviews.first(where: { $0 is UIButton }) as? UIButton
        button?.sendActions(for: .allEvents)
        XCTAssert(Self.customApplication.hasCalledOpen)
        XCTAssertEqual(Self.customApplication.url?.absoluteString, "testeApplication://onboading/second")
    }
}
