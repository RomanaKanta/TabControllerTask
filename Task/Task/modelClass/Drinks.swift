//
//  Drinks.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import Foundation

struct DrinksProduct: ResponseObjectSerializable{
    var drinks: [Drinks]
    
    init?(response: HTTPURLResponse, representation: Any) {
        guard
            let representation = representation as? [String: Any]
            else { return nil }
        self.drinks =  Drinks.collection(from: response, withRepresentation: representation["drinks"] ?? [])
    }
}

struct Drinks: ResponseObjectSerializable, ResponseCollectionSerializable{
    var idDrink: String
    var strDrink: String
    var strCategory: String
    var strDrinkThumb: String
    var strAlcoholic: String
    var strGlass: String
    
    var strInstructions: String
    var strInstructionsES: String
    var strInstructionsDE: String
    var strInstructionsFR: String
    var strInstructionsIT: String
    var strIngredients = [String]()
    
    init?(response: HTTPURLResponse, representation: Any) {
        guard
            let representation = representation as? [String: Any]
            else { return nil }
        
        self.idDrink = representation["idDrink"] as? String ?? ""
        self.strDrink = representation["strDrink"] as? String ?? ""
        self.strCategory = representation["strCategory"] as? String ?? ""
        self.strDrinkThumb = representation["strDrinkThumb"] as? String ?? ""
        self.strAlcoholic = representation["strAlcoholic"] as? String ?? ""
        self.strGlass = representation["strGlass"] as? String ?? ""
        self.strInstructions = representation["strInstructions"] as? String ?? ""
        self.strInstructionsES = representation["strInstructionsES"] as? String ?? ""
        self.strInstructionsDE = representation["strInstructionsDE"] as? String ?? ""
        self.strInstructionsFR = representation["strInstructionsFR"] as? String ?? ""
        self.strInstructionsIT = representation["strInstructionsIT"] as? String ?? ""
        
        for i in 1...15 {
            let ingreient = representation["strIngredient\(i)"] as? String ?? ""
            let measure = representation["strMeasure\(i)"] as? String ?? ""
            if (!ingreient.isEmpty){
                self.strIngredients.append("\(ingreient) : \(measure)")
            }
        }
    }
}
