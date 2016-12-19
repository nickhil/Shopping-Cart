//
//  DisplayCartViewController.swift
//  Shopping Cart
//
//  Created by Nikhil on 18/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DisplayCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    static let SharedInstance = DisplayCartViewController()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var requestProduct: NSFetchRequest<Item> = Item.fetchRequest()
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var frController: NSFetchedResultsController<Item>!
    var data: [Item]!
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var cancelButtonPressed: UIBarButtonItem!
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        frController = fetchResultsController()
        data = frController.fetchedObjects
    }
    override func viewWillAppear(_ animated: Bool) {
        frController = fetchResultsController()
        data = frController.fetchedObjects
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.clear
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x: 0, y: 10,width: self.view.frame.size.width,height: 120))
        
        whiteRoundedView.layer.backgroundColor = CGColor.init(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
        whiteRoundedView.layer.masksToBounds = false
        whiteRoundedView.layer.cornerRadius = 2.0
        whiteRoundedView.layer.shadowOffset = CGSize(width: -1,height: 1)
        whiteRoundedView.layer.shadowOpacity = 0.2
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubview(toBack: whiteRoundedView)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell")
        cell?.textLabel?.text = data[indexPath.row].name
        cell?.detailTextLabel?.text = "Name \(data[indexPath.row].name!) \t Price \(data[indexPath.row].price! ) "
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productInfo = ProductDetails.sharedInstance.productData[(indexPath as NSIndexPath).row]
        let URL = productInfo.permalink
        OpenURL.sharedInstance.openBrowser(Link: URL)

    }
    
    func fetchResultsController() -> NSFetchedResultsController<Item>
    {
        self.requestProduct.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: self.requestProduct , managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: nil)
        do
        {
            try frc.performFetch()
        }
        catch
        {
            print("unable to fetch the objects using frc")
            return frc
        }
        
        return frc
    }
    
    


}
