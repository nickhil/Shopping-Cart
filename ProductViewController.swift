//
//  ProductViewController.swift
//  Shopping Cart
//
//  Created by Nikhil on 17/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit

class ProductViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var product : CategoryList!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        // self.name.text = product.code
       /* ViewController.sharedInstance.searchProduct(categoryID: product.code, completionHandler: {(success, error) in
            if success{
                print("success")
            }
            else {
                print("fail")
            }
        })*/
    self.tableView.reloadData()
    }

    
    override func viewDidLoad() {
        ViewController.sharedInstance.searchProduct(categoryID: product.code, completionHandler: {(success, error) in
            if success{
                print("success")
            }
            else {
                print("fail")
            }
        })
        self.tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductDetails.sharedInstance.productData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productInfo = ProductDetails.sharedInstance.productData[(indexPath as NSIndexPath).row]
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle , reuseIdentifier: "studentCell")
     //   cell.imageView?.image = UIImage(named: "Pin")
        cell.textLabel?.text = productInfo.name
        cell.detailTextLabel?.text = productInfo.price
        let code = productInfo.id
        cell.textLabel?.text = code
        return cell
    }

  
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let productController = self.storyboard!.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        productController.productCode = (currentCell.textLabel?.text)!
        
        self.navigationController!.pushViewController(productController, animated: true)
    }
 
    
    
    
/*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productController = self.storyboard!.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        
        productController.product = self.allCategories[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(productController, animated: true)
    }
    */

    
    @IBOutlet weak var backButton: UIBarButtonItem!
       @IBOutlet weak var name: UILabel!

    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var search: UIButton!
    
    @IBAction func searchButton(_ sender: AnyObject) {
        ViewController.sharedInstance.searchProduct(categoryID: product.code, completionHandler: {(success, error) in
            if success{
            print("success")
            }
            else {
            print("fail")
            }
        })
        }
    
 }
