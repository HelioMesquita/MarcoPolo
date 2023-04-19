//
//  MainViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import MarcoPolo
import UIKit

class MainViewController: BaseViewController, DeeplinkViewController {
  typealias DeeplinkParameterReceiveType = String

  static var path: String = "main"

  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "Main"

    stackView.addArrangedSubview(label)

    let button1 = UIButton(primaryAction: UIAction(title: "Onboarding First", handler: { _ in
      self.openDeeplink(path: "onboading/first", arguments: "first screen")
    }))
    stackView.addArrangedSubview(button1)

    let button2 = UIButton(primaryAction: UIAction(title: "Onboarding Second", handler: { _ in
      self.openDeeplink(path: "onboading/second", arguments: "middle screen")
    }))
    stackView.addArrangedSubview(button2)

    let button3 = UIButton(primaryAction: UIAction(title: "Onboarding Third", handler: { _ in
      self.openDeeplink(path: "onboading/third", arguments: 1992)
    }))
    stackView.addArrangedSubview(button3)
  }
}
