//
//  OnboardingSecondViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import MarcoPolo
import UIKit

class OnboardingSecondViewController: BaseViewController, DeeplinkViewController, DeeplinkOpener {
  typealias DeeplinkParameterReceiveType = String

  static var path: String = "onboading/second"

  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "Second"

    stackView.addArrangedSubview(label)

    let label2 = UILabel()
    label2.text = arguments
    stackView.addArrangedSubview(label2)

      let button2 = UIButton(primaryAction: UIAction(title: "Next Onboarding Screen", handler: { _ in
        self.openDeeplink(path: "onboading/third", arguments: "middle screen")
      }))
      stackView.addArrangedSubview(button2)
  }
}
