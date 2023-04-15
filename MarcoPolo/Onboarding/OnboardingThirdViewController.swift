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
    
    // Do any additional setup after loading the view.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
