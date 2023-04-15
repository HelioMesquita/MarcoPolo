//
//  OnboardingThirdViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import UIKit

class OnboardingThirdViewController: BaseViewController, DeeplinkViewController {
  static var path: String = "onboading/third"

  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "Third"
    stackView.addArrangedSubview(label)

    let label2 = UILabel()
    label2.text = arguments as? String
    stackView.addArrangedSubview(label2)
  }
}
