//
//  MainViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

class MainViewController: BaseViewController, DeeplinkViewController {

  static var path: String = "main"

  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "Main"

    stackView.addArrangedSubview(label)

    let button1 = UIButton(primaryAction: UIAction(title: "Onboarding First", handler: { action in
      self.openDeeplink(path: "onboading/first")
    }))
    stackView.addArrangedSubview(button1)

    let button2 = UIButton(primaryAction: UIAction(title: "Onboarding Second", handler: { action in
      self.openDeeplink(path: "onboading/second")
    }))
    stackView.addArrangedSubview(button2)

    let button3 = UIButton(primaryAction: UIAction(title: "Onboarding Third", handler: { action in
      self.openDeeplink(path: "onboading/third")
    }))
    stackView.addArrangedSubview(button3)
  }

}


class BaseViewController: UIViewController {

  lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
  }

  func openDeeplink(path: String, arguments: Any? = nil) {
    guard let urlScheme = Bundle.externalURLSchemes.first,
          let url = URL(string: urlScheme + "://" + path) else {
      return
    }

    UIApplication.shared.open(url)
  }

}

extension Bundle {

  static let externalURLSchemes: [String] = {
    guard let urlTypes = main.infoDictionary?["CFBundleURLTypes"] as? [[String: Any]] else {
      return []
    }

    var result: [String] = []
    for urlTypeDictionary in urlTypes {
      guard let urlSchemes = urlTypeDictionary["CFBundleURLSchemes"] as? [String] else { continue }
      guard let externalURLScheme = urlSchemes.first else { continue }
      result.append(externalURLScheme)
    }

    return result
  }()

}
