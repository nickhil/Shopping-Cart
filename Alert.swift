//
//  Alert.swift
//  Shopping Cart
//
//  Created by Nikhil on 19/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class Alert: UIAlertController {
    
    static let sharedInstance = Alert()
    func showAlert(controller: UIViewController, title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
