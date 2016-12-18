//
//  ProductDetails.swift
//  Shopping Cart
//
//  Created by Nikhil on 17/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation

class ProductDetails: NSData {
    static let sharedInstance = ProductDetails()
    var productData = [ProductList]()
}
