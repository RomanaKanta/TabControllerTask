//
//  Food.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import Foundation

struct FoodProduct: ResponseObjectSerializable{
    var categories: [Categories]
    
    init?(response: HTTPURLResponse, representation: Any) {
        guard
            let representation = representation as? [String: Any]
            else { return nil }
        
        self.categories =  Categories.collection(from: response, withRepresentation: representation["categories"] ?? [])
    }
}

struct Categories: ResponseObjectSerializable, ResponseCollectionSerializable{
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
    
    init?(response: HTTPURLResponse, representation: Any) {
        guard
            let representation = representation as? [String: Any]
            else { return nil }
        
        self.idCategory = representation["idCategory"] as? String ?? ""
        self.strCategory = representation["strCategory"] as? String ?? ""
        self.strCategoryThumb = representation["strCategoryThumb"] as? String ?? ""
        self.strCategoryDescription = representation["strCategoryDescription"] as? String ?? ""
    }
}
