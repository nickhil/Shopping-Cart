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
    var fetchProduct: NSFetchRequest<Item> = Item.fetchRequest()
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
   // var productDetail : ProductDetails
    var productCode : String = ""
//    var productDetail([ProductDetails.sharedInstance.productData])
    var productDetail : ProductList!

    @IBOutlet weak var displayCartButton: UIButton!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        displayDetails()
    }
    
    @IBAction func displayCartButtonPressed(_ sender: AnyObject) {
        
        
        
        }
    func displayDetails(){
        codeLabel.text = productDetail.id
        nameLabel.text = productDetail.name
        priceLabel.text = productDetail.price
    }
    
    
    
    @IBAction func addToCartButtonPressed(_ sender: AnyObject) {
 
        /*
       let entityDescription =
            NSEntityDescription.entity(forEntityName: "Product" ,
                                       in: context)
        
        let product = Product(entity: entityDescription!, insertInto: context)
 
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
 */
        
        
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "Item" ,
                                       in: context)
        
        let item = Item(entity: entityDescription!, insertInto: context)
        
        item.id = productDetail.id
        item.image_url = productDetail.image_url
        item.instock = productDetail.instock
        item.name = productDetail.name
        item.permalink = productDetail.permalink
        item.price = productDetail.price
        item.ship = productDetail.ship
        
        do {
            try context.save()
            print("Saved")
        } catch let error {
            print(error.localizedDescription)
        }
        
 }
   }
