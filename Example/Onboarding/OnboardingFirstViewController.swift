//
//  OnboardingFirstViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import MarcoPolo
import UIKit

class OnboardingFirstViewController: BaseViewController, DeeplinkViewController, DeeplinkOpener {
  typealias DeeplinkParameterReceiveType = String

  static var path: String = "onboading/first"

  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "First"

    stackView.addArrangedSubview(label)

    let label2 = UILabel()
    label2.text = arguments
    stackView.addArrangedSubview(label2)

      let button1 = UIButton(primaryAction: UIAction(title: "Next Onboarding Screen", handler: { _ in
        self.openDeeplink(path: "onboading/second", arguments: "first screen")
      }))
      stackView.addArrangedSubview(button1)
  }
}
