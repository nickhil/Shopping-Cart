//
//  ProductDetailsViewController.swift
//  Shopping Cart
//
//  Created by Nikhil on 18/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailsViewController: UIViewController{
    
    
   // var productDetail : ProductDetails
    var productCode : String = ""
//    var productDetail([ProductDetails.sharedInstance.productData])
    var productDetail = [ProductList]()
    
    
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        codeLabel.text = productCode
    }
    
    func displayDetails(code: String){
        
        if let found = find(productDetail.map({}))
        
    }
    
    

}
