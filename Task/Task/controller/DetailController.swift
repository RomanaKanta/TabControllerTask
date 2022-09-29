//
//  DetailController.swift
//  Task
//
//  Created by Romana on 29/9/22.
//

import UIKit

class DetailController: BaseController {
    var drinksImage: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "placeholder")
        view.contentMode = .scaleToFill
        return view
    }()
    var drinksTitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.boldSystemFont(ofSize: 16)
        return view
    }()
    var recipe: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 15)
        view.backgroundColor = .clear
        view.isEditable = false
        view.isSelectable = false
        return view
    }()
    var item: Drinks!
    
    var dataConsumer = DataConsumer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setToolbar(title: "Recipe", haveBack: true)
        
        self.view.addSubview(drinksImage)
        self.view.addSubview(drinksTitle)
        self.view.addSubview(recipe)
        
        let constraints = [
            drinksImage.topAnchor.constraint(equalTo: toolbar.bottomAnchor, constant: 30),
            drinksImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            drinksImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            drinksImage.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25),
            
            drinksTitle.topAnchor.constraint(equalTo: drinksImage.bottomAnchor, constant: 15),
            drinksTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            drinksTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),
            
            recipe.topAnchor.constraint(equalTo: drinksTitle.bottomAnchor, constant: 15),
            recipe.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            recipe.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30),
            recipe.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        dataConsumer.loadImage(url: item.strDrinkThumb, imageView: drinksImage)
        drinksTitle.text = item.strDrink
        setText()
        
    }
    
    func setText(){
        let attributedString = NSMutableAttributedString(string: "")
        attributedString.append(NSMutableAttributedString(string: "Category: \(item.strCategory) \n\n\n"))
        attributedString.append(NSMutableAttributedString(string: "Alcoholic: \(item.strAlcoholic) \n\n\n"))
        attributedString.append(NSMutableAttributedString(string: "Glass: \(item.strGlass) \n\n\n"))
        attributedString.append(NSMutableAttributedString(string: "Ingredients: \n\n"))
        
        for ins in item.strIngredients {
            attributedString.append(NSMutableAttributedString(string: "\(ins) \n"))
        }
        attributedString.append(NSMutableAttributedString(string: "\n\n Instructions: \n\n"))
        
        attributedString.append(NSMutableAttributedString(string: "\n\n \(item.strInstructions)"))
        
        attributedString.append(NSMutableAttributedString(string: "\n\n \(item.strInstructionsDE)"))
        
        attributedString.append(NSMutableAttributedString(string: "\n\n \(item.strInstructionsES)"))
        
        attributedString.append(NSMutableAttributedString(string: "\n\n \(item.strInstructionsFR)"))
        
        attributedString.append(NSMutableAttributedString(string: "\n\n \(item.strInstructionsIT)"))
        
        recipe.attributedText = attributedString
    }
    
}
