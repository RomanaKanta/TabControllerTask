//
//  DataConsumer.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import Foundation
import Alamofire

protocol CustomProtocol {
    func forMakeup(content: [MakeupProduct])
    func forFood(content: [Categories])
    func forDrinks(content: [Drinks])
}

struct DataConsumer {
    
    var controller: UIViewController!
    var delegate: CustomProtocol!
    
    init(controller: UIViewController, delegate: CustomProtocol){
        self.controller = controller
        self.delegate = delegate
    }
    init(){}
    
    func getMakeupData(){
        print("DataConsumer -> getMakeupData")
        
        RestApiService.getDataCollection(urlString: RestEndPoint.MAKEUP, view: self.controller.view){(response : DataResponse<[MakeupProduct]>) -> Void in
            switch response.result {
            case .success:
                let serviceResponse:[MakeupProduct] = response.result.value!
                self.delegate.forMakeup(content: serviceResponse)
                break
                
            case .failure(let error):
                if (type(of: error)==ErrorResponse.self){
                    let errorResponse = error as! ErrorResponse
                    showAlert(parent: self.controller, msg: errorResponse.message)
                }else{
                    showAlert(parent: self.controller, msg: error.localizedDescription)
                }
                break
            }
        }
    }
    
    func getFoodData(){
        print("DataConsumer -> getFoodData")
        
        RestApiService.getDataObject(urlString: RestEndPoint.FOOD, view: self.controller.view){(response : DataResponse<FoodProduct>) -> Void in
            switch response.result {
            case .success:
                let serviceResponse:FoodProduct = response.result.value!
                self.delegate.forFood(content: serviceResponse.categories)
                break
                
            case .failure(let error):
                if (type(of: error)==ErrorResponse.self){
                    let errorResponse = error as! ErrorResponse
                    showAlert(parent: self.controller, msg: errorResponse.message)
                }else{
                    showAlert(parent: self.controller, msg: error.localizedDescription)
                }
                break
            }
        }
    }
    
    func getDrinksData(){
        print("DataConsumer -> getDrinksData")
        
        RestApiService.getDataObject(urlString: RestEndPoint.DRINKS, view: self.controller.view){(response : DataResponse<DrinksProduct>) -> Void in
            switch response.result {
            case .success:
                let serviceResponse:DrinksProduct = response.result.value!
                self.delegate.forDrinks(content: serviceResponse.drinks)
                break
                
            case .failure(let error):
                if (type(of: error)==ErrorResponse.self){
                    let errorResponse = error as! ErrorResponse
                    showAlert(parent: self.controller, msg: errorResponse.message)
                }else{
                    showAlert(parent: self.controller, msg: error.localizedDescription)
                }
                break
            }
        }
    }
    
    func loadImage(url: String, imageView: UIImageView){
        Alamofire.request(url).responseImage { response in
                if let image = response.result.value {
                    let scaledImage = image.af_imageScaled(to: CGSize(width: 300,height: 300))
                    DispatchQueue.main.async {
                        imageView.image = scaledImage
                    }
                }
            }
    }
    
    func showAlert(parent: UIViewController, msg: String){
        
        let alert = UIAlertController(title: "\n", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        parent.present(alert, animated: true, completion:nil)
    }
    
    
}
