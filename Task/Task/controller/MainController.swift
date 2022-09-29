//
//  MainController.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import UIKit

class MainController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .white
        
        setGradientBackground(colorOne: UIColor(hexString: AppConstant.SECONDARY_COLOR)!, colorTwo: UIColor(hexString: AppConstant.APP_COLOR)!)
        
//        self.tabBar.backgroundColor = UIColor(hexString: AppConstant.APP_COLOR)
        
        let makeup = ChildController()
        makeup.tabTag = AppConstant.TAB1
        
        makeup.tabBarItem.title = AppConstant.TAB1
        makeup.tabBarItem.image = UIImage(named: "makeup_normal")
        makeup.tabBarItem.selectedImage = UIImage(named: "makeup_select")
        
        let food = ChildController()
        food.tabTag = AppConstant.TAB2
        
        food.tabBarItem.title = AppConstant.TAB2
        food.tabBarItem.image = UIImage(named: "food_normal")
        food.tabBarItem.selectedImage = UIImage(named: "food_select")
        
        let drinks = ChildController()
        drinks.tabTag = AppConstant.TAB3
        
        drinks.tabBarItem.title = AppConstant.TAB3
        drinks.tabBarItem.image = UIImage(named: "drinks_normal")
        drinks.tabBarItem.selectedImage = UIImage(named: "drinks_select")
       
        self.setViewControllers([makeup, food, drinks], animated: false)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for:.normal)

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:.selected)
        
    }
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor)  {
        let layerGradient = CAGradientLayer()
        layerGradient.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        layerGradient.colors = [colorOne.cgColor, colorTwo.cgColor]
//        layerGradient.startPoint = CGPoint(x: 0, y: 0.5)
//        layerGradient.endPoint = CGPoint(x: 1, y: 0.5)
        layerGradient.locations = [0.0, 0.10]
        self.tabBar.layer.insertSublayer(layerGradient, at: 0)
    }
}
