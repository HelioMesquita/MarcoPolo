//
//  BaseViewController.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 15/04/23.
//

import UIKit
//import FirebaseAnalytics

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
}
