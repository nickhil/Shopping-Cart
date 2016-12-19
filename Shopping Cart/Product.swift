//
//  Product.swift
//  Shopping Cart
//
//  Created by Nikhil on 17/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit

struct ProductList{
    let name: String
    let price: String
    let image_url: String
    let permalink: String
    let instock: String
    let id: String
    let ship: String
    
    static let shipKey = "ships_in_days"
    static let idKey = "id"
    static let PriceKey = "price"
    static let NameKey = "name"
    static let Image_urlKey = "image_url"
    static let PermalinkKey = "permalink"
    static let instock = "instock"
    
    init(details: [String : AnyObject]) {
        self.name = details[ProductList.NameKey ] as! String
        self.image_url = details[ProductList.Image_urlKey] as! String
        self.permalink = details[ProductList.PermalinkKey] as! String
        self.price = details[ProductList.PriceKey] as! String
        self.instock = details[ProductList.instock] as! String
        self.id = details[ProductList.idKey] as! String
        self.ship = details[ProductList.shipKey] as! String
    }
}
