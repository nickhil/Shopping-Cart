//
//  Product+CoreDataProperties.swift
//  Shopping Cart
//
//  Created by Nikhil on 19/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product");
    }

    @NSManaged public var id: String?
    @NSManaged public var image_url: String?
    @NSManaged public var instock: String?
    @NSManaged public var name: String?
    @NSManaged public var permalink: String?
    @NSManaged public var price: String?
    @NSManaged public var ship: String?

}
