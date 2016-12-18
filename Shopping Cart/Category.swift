//
//  Category.swift
//  Shopping Cart
//
//  Created by Nikhil on 17/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit

struct CategoryList {
    let title: String
    let code: String
    let imageName: String
    
    static let TitleKey = "TitleKey"
    static let ImageNameKey = "ImageNameKey"
    static let CodeKey = "CodeKey"
    
    init(dictionary: [String : String]) {
        
        self.code = dictionary[CategoryList.CodeKey]!
        self.title = dictionary[CategoryList.TitleKey]!
        self.imageName = dictionary[CategoryList.ImageNameKey ]!
    }
}

extension CategoryList {
    static var allCategories: [CategoryList] {
        var categoryArray = [CategoryList]()
                for a in CategoryList.categoryData() {
            categoryArray.append(CategoryList(dictionary: a))
        }
        return categoryArray
    }

    static func categoryData() -> [[String : String]] {
        return [
            [CategoryList.CodeKey : "1", CategoryList.TitleKey : "Gaming", CategoryList.ImageNameKey : "gaming"],
            [CategoryList.CodeKey : "5266", CategoryList.TitleKey : "Books", CategoryList.ImageNameKey : "books"],
            [CategoryList.CodeKey : "371", CategoryList.TitleKey : "Clothing", CategoryList.ImageNameKey : "clothing"],
            [CategoryList.CodeKey : "948", CategoryList.TitleKey : "Watches", CategoryList.ImageNameKey : "watches"],
            [CategoryList.CodeKey : "130", CategoryList.TitleKey : "Sports & Fitness", CategoryList.ImageNameKey : "sports"],
            [CategoryList.CodeKey : "1528", CategoryList.TitleKey : "Auto-Parts", CategoryList.ImageNameKey : "autoparts"],        
        ]
    }
}
