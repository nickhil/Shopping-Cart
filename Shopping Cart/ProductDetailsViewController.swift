//
//  ProductDetailsViewController.swift
//  Shopping Cart
//
//  Created by Nikhil on 18/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ProductDetailsViewController: UIViewController{
    @IBOutlet weak var addToCartButton: UIButton!

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
   // var productDetail : ProductDetails
    var productCode : String = ""
//    var productDetail([ProductDetails.sharedInstance.productData])
    var productDetail : ProductList!

    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        displayDetails()
    }
    
    func displayDetails(){
        codeLabel.text = productDetail.id
        nameLabel.text = productDetail.name
        priceLabel.text = productDetail.price
    }
    
    @IBAction func addToCartButtonPressed(_ sender: AnyObject) {
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "Products" ,
                                       in: context)
        
        let product = Products(entity: entityDescription!, insertInto: context)
        
        product.id = productDetail.id
        product.image_url = productDetail.image_url
        product.instock = productDetail.instock
        product.name = productDetail.name
        product.permalink = productDetail.permalink
        product.price = productDetail.price
        product.ship = productDetail.ship
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
     }
   }
