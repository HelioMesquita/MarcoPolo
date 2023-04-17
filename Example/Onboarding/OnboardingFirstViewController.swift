//
//  OnboardingFirstViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit
import MarcoPolo

class OnboardingFirstViewController: BaseViewController, DeeplinkViewController {
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
  }

}
