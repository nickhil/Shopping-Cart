//
//  Network.swift
//  Shopping Cart
//
//  Created by Nikhil on 20/12/16.
//  Copyright © 2016 Nikhil. All rights reserved.
//

import Foundation
import UIKit

class NetworkClass{
    
    static let sharedInstance = NetworkClass()
    
    func searchProduct(categoryID: String,completionHandler: @escaping (_ success: Bool, _ error: String?)-> Void) {
        
        var test : Int = 0
        let method = "https://www.shimply.com/api/search/list?category_id=\(categoryID)&key=3dfbd87d98638c8a3dc9b778124a2873"
        
        let url = URL(string: method)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest){(data,response,error) in
            
            guard (error == nil) else{
                
                completionHandler(false, error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                completionHandler(false, "No data was returned.")
                return
            }
            
            let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print(json)
            
            var parsedData: NSDictionary!
            do
            {
                parsedData = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
            }
            catch
            {
                print("unable to parse data")
                return
            }
            print(parsedData)
            
            ProductDetails.sharedInstance.productData.removeAll()
            for key in parsedData.allKeys
            {
                if let data1 = parsedData[key] as? [String:AnyObject] {
                    ProductDetails.sharedInstance.productData.append(ProductList.init(details: data1))
                    test+=1
                }
                else {
                    print("cannot find data")
                }
            }
            if test != 0 {
                
                print("Object data is \(ProductDetails.sharedInstance.productData)")
                
                completionHandler(true,"Done")
                return
            }
            else
            {
                completionHandler(false,"Fail")
            }
        }
        test = 0
        task.resume()
    }
}


