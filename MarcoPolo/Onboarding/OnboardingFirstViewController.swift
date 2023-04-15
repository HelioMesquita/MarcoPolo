//
//  OnboardingFirstViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

class OnboardingFirstViewController: BaseViewController, DeeplinkViewController {
  static var path: String = "onboading/first"

  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "First"

    stackView.addArrangedSubview(label)

    let label2 = UILabel()
    label2.text = arguments as? String
    stackView.addArrangedSubview(label2)
  }
}
