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
    
    @IBOutlet weak var tableView: UITableView!
    

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell")
        cell?.textLabel?.text = data[indexPath.row].name
        cell?.detailTextLabel?.text = "Name \(data[indexPath.row].name!) \t Price \(data[indexPath.row].price! ) "
        return cell!
    }
    
    func fetchResultsController() -> NSFetchedResultsController<Item>
    {
        self.requestProduct.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let frc = NSFetchedResultsController(fetchRequest: self.requestProduct , managedObjectContext: self.context, sectionNameKeyPath: nil, cacheName: nil)
    //    frc.delegate = self
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
