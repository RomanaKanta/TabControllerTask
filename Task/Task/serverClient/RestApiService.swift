//
//  RestApiService.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import Foundation
import Alamofire

class RestApiService{
    
    static func getDataObject<T:ResponseObjectSerializable>(urlString: String,view:UIView ,
                                                                        result: @escaping(_ res: DataResponse<T>)->Void){
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let loader = NVActivityIndicatorView(frame: view.frame, color: UIColor(hexString: AppConstant.APP_COLOR)!)
        view.addSubview(loader)
        loader.startAnimating()
        
        let url : URLConvertible = urlString
        
        manager.request(url, method: .get, encoding: JSONEncoding.default)
            .validate()
            .responseObject {(response: DataResponse<T>) in
                loader.stopAnimating()
                result(response)
        }
    }
   
    static func getDataCollection<T:ResponseCollectionSerializable>(urlString: String,view:UIView ,
                                                                                   result: @escaping(_ res: DataResponse<[T]>)->Void){
      
                    
                    let loader = NVActivityIndicatorView(frame: view.frame, color: UIColor(hexString: AppConstant.APP_COLOR)!)
                    view.addSubview(loader)
                    loader.startAnimating()
                    
                    let manager = Alamofire.SessionManager.default
                    manager.session.configuration.timeoutIntervalForRequest = 60
                    
                    let url : URLConvertible = urlString;
                    
        
        manager.request(url, method: .get)
            .validate()
            .responseCollection {(response: DataResponse<[T]>) in
                loader.stopAnimating()
                    result(response)
        }
    }
    
    static func getImage(urlString: String, result: @escaping(_ res: UIImage)->Void){
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        let url : URLConvertible = urlString;
        manager.request(url, method: .get)
            .response { response in
                           guard let image = UIImage(data:response.data!) else {
                               return
                           }
                let imageData = image.jpegData(compressionQuality: 1.0)
                result(UIImage(data : imageData!)!)
        }
    }
}
