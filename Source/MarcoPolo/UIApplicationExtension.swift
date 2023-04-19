//
//  UIApplicationExtension.swift
//  MarcoPolo
//
//  Created by Hélio Mesquita on 18/04/23.
//

import Foundation

public extension UIApplication {

  var arguments: Any? {
    get {
      return objc_getAssociatedObject(self, &AssociatedKeys.toggleState) ?? nil
    }
    set(newValue) {
      objc_setAssociatedObject(self, &AssociatedKeys.toggleState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
  }
}
