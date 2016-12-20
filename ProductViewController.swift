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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setUIEnable(enable: false)
        tableView.delegate = self
        tableView.dataSource = self
        NetworkClass.sharedInstance.searchProduct(categoryID: self.product.code, completionHandler: {(success, error) in
            self.setUIEnable(enable: false)
            if success{
                self.setUIEnable(enable: false)
                DispatchQueue.main.async {
                performUIUpdatesOnMain(updates: {
                    self.tableView.reloadData()
                    self.setUIEnable(enable: true)
                    })
                }
            }
            else {
                performUIUpdatesOnMain(updates:{
                    Alert.sharedInstance.showAlert(controller: self, title: "Internet Connection Failed", message: "Please Check the Internet")
                    })
               self.setUIEnable(enable: true)
            }
        })
    self.tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
      tableView.delegate = nil
        tableView.dataSource = nil
        
    }
    
    override func viewDidLoad() {
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductDetails.sharedInstance.productData.count
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.clear
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 0, y: 10,width: self.view.frame.size.width,height: 110))
        
        whiteRoundedView.layer.backgroundColor = CGColor.init(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1,height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productInfo = ProductDetails.sharedInstance.productData[(indexPath as NSIndexPath).row]
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle , reuseIdentifier: "studentCell")
       cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = productInfo.name
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "INR \(productInfo.price)"
    
        
        let url = NSURL(string: productInfo.image_url)
        let data = NSData(contentsOf: url! as URL)
        if data != nil{
            cell.imageView?.image = setImage(image: UIImage(data: data! as Data)!, scaledToSize: CGSize (width: 100 ,height: 100))
        }
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productInfo = ProductDetails.sharedInstance.productData[(indexPath as NSIndexPath).row]
        let productController = self.storyboard!.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        productController.productDetail = productInfo
        productController.productCode = (currentCell.textLabel?.text)!
        self.navigationController!.pushViewController(productController, animated: true)
    }

    func setUIEnable(enable: Bool){
        if enable{
        performUIUpdatesOnMain(updates: {
        self.tableView.alpha = 1
        self.activityIndicator.stopAnimating()
        })
        }else{
            performUIUpdatesOnMain (updates: {
                self.tableView.alpha = 0.5
                self.activityIndicator.startAnimating()
            })
            }
    
    }
    
    func setImage(image: UIImage,scaledToSize newSize:CGSize) -> UIImage{
    
            UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        return image
    }
    
       
 }
