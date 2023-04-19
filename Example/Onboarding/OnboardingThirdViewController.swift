//
//  OnboardingThirdViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 14/04/23.
//

import MarcoPolo
import UIKit

class OnboardingThirdViewController: BaseViewController, DeeplinkViewController {
  typealias DeeplinkParameterReceiveType = Int

  static var path: String = "onboading/third"

  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    label.text = "Third"
    stackView.addArrangedSubview(label)

    let label2 = UILabel()
    label2.text = "\(String(describing: arguments))"
    stackView.addArrangedSubview(label2)
  }
}
