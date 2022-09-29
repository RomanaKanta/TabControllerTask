//
//  Makeup.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import Foundation

struct MakeupProduct: ResponseObjectSerializable, ResponseCollectionSerializable{
  
    var id: Double
    var brand: String
    var name: String
    var price: String
    var price_sign: String
    var image_link: String
    
    init?(response: HTTPURLResponse, representation: Any) {
        guard
            let representation = representation as? [String: Any]
            else { return nil }
        
        self.id = representation["id"] as? Double ?? 0
        self.brand = representation["brand"] as? String ?? ""
        self.name = representation["name"] as? String ?? ""
        self.price = representation["price"] as? String ?? ""
        self.price_sign = representation["price_sign"] as? String ?? "$"
        self.image_link = representation["image_link"] as? String ?? ""
    }
    
    init(name: String,
         price: String){
        self.name = name
        self.price = price
        self.id = 0
        self.brand = ""
       
        self.price_sign = ""
        self.image_link = ""
    }
}
