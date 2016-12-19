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
    
    @IBOutlet weak var cartButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let allCategories = CategoryList.allCategories
   
    @IBOutlet weak var cartB: UIButton!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allCategories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.clear
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 0, y: 10,width: self.view.frame.size.width,height: 90))
        
        whiteRoundedView.layer.backgroundColor = CGColor.init(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1,height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell")!
        let category = self.allCategories[(indexPath as NSIndexPath).row]
    
        cell.textLabel?.text = category.title
        cell.imageView?.image = UIImage(named: category.imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productController = self.storyboard!.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
      
        productController.product = self.allCategories[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(productController, animated: true)
    }
    
    
    
}

