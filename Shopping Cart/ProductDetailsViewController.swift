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
    var productCode : String = ""
    var productDetail : ProductList!

    @IBOutlet weak var fontStepper: UIStepper!
    @IBOutlet weak var displayCartButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
  
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var inStockLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var shipLabel: UILabel!
    override func viewDidLoad() {
        displayDetails()
    }
    
    
    @IBAction func fontStepperChanged(_ sender: AnyObject) {
        nameLabel.font = nameLabel.font.withSize(CGFloat(fontStepper.value))
        priceLabel.font = priceLabel.font.withSize(CGFloat(fontStepper.value))
        inStockLabel.font = inStockLabel.font.withSize(CGFloat(fontStepper.value))
        shipLabel.font = shipLabel.font.withSize(CGFloat(fontStepper.value))
        
    
    }
    func displayDetails(){
        nameLabel.numberOfLines = 0
        nameLabel.text = "Product:\(productDetail.name)"
        priceLabel.text = "Cost: \(productDetail.price) INR"
        inStockLabel.text = "In Stock: \(productDetail.instock) piece(s)"
        shipLabel.text = "To be Shipped in:\(productDetail.ship) days"
        productImage.contentMode = .scaleAspectFit
        let url = NSURL(string: productDetail.image_url)
        let data = NSData(contentsOf: url! as URL)
        if data != nil{
        performUIUpdatesOnMain(updates: {
            self.productImage.image = UIImage(data: data! as Data)
         })
        }
        
    }
    
    @IBAction func addToCartButtonPressed(_ sender: AnyObject) {
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
            Alert.sharedInstance.showAlert(controller: self, title: "Success", message: "Product added to your cart succesfully")
            print("Saved")
        } catch let error {
            Alert.sharedInstance.showAlert(controller: self, title: "Cannot add product to the cart", message: error.localizedDescription)
        }
        }
    
   
}
