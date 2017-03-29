//
//  UIAlertController+Convenience.swift
//  Vehicles
//
//  Created by Taras on 22.03.17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import UIKit

extension UIAlertController {
  class func alertControllerWithTitle(title:String, message:String) -> UIAlertController {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    return controller
  }
  class func alertControllerWithNumberInput(title: String, message:String, buttonTitle: String, handler: @escaping (Int?) -> Void) -> UIAlertController {
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    controller.addTextField(configurationHandler: {$0.keyboardType = .numberPad})
    controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      controller.addAction(UIAlertAction(title: buttonTitle, style: .default) {
        action in
        let textFields = controller.textFields as? [UITextField]!
        let value = textFields?[0].text
        let toInt: Int? = Int(value!)
        handler(toInt)
      })
      return controller
    
  }
}
