//
//  OpenURL.swift
//  Shopping Cart
//
//  Created by Nikhil on 19/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import UIKit

class OpenURL: UIViewController {
    
    static let sharedInstance = OpenURL()
    func openBrowser(Link: String) {
            if let url = URL(string: Link) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: { (sucess) in
                    print("Open \(url):\(sucess)")
                })
            }
            else {
                let sucess = UIApplication.shared.openURL(url)
                print("Open \(url):\(sucess)")
            }
        }
    }
}
