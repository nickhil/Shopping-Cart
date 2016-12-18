//
//  CategoryViewController.swift
//  Shopping Cart
//
//  Created by Nikhil on 17/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let allCategories = CategoryList.allCategories
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")!
        let category = self.allCategories[(indexPath as NSIndexPath).row]
    
        cell.textLabel?.text = category.title
        cell.imageView?.image = UIImage(named: category.imageName)
        
        // If the cell has a detail label, we will put the evil scheme in.
       /* if let detailTextLabel = cell.detailTextLabel {
            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
        }
        */
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productController = self.storyboard!.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
      
        productController.product = self.allCategories[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(productController, animated: true)
    }
    
    
    
}

