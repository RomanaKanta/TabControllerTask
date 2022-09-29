//
//  DataRequest.swift
//  Task
//
//  Created by Romana on 28/9/22.
//

import Foundation
import Alamofire

protocol ResponseObjectSerializable {
    init?(response: HTTPURLResponse, representation: Any)
}

extension DataRequest {
    
    @discardableResult
    func responseObject<T: ResponseObjectSerializable>(
        _ queue: DispatchQueue? = nil,
        _ completionHandler: @escaping (DataResponse<T>) -> Void)-> Self{
        
        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in

            guard error == nil else { return .failure(error!) }
            
            let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            
            let result = jsonResponseSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(result.error!)
            }
            
            guard let failResponse = response, let responseObject = T(response: failResponse, representation: jsonObject) else {
                return .failure(ErrorResponse(dictionaryObj: jsonObject as! NSDictionary))
            }
            return .success(responseObject)
        }
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseCollection<T: ResponseCollectionSerializable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self
    {
        let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
         
            guard error == nil else { return .failure(error!) }
            
            let jsonSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(result.error!)
            }
            guard let response = response else {
                return .failure(ErrorResponse(dictionaryObj: jsonObject as! NSDictionary))
            }
            return .success(T.collection(from: response, withRepresentation: jsonObject))
        }
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}

protocol ResponseCollectionSerializable {
    static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Self]
}

extension ResponseCollectionSerializable where Self: ResponseObjectSerializable {
    static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Self] {
        var collection: [Self] = []
        
        if let representation = representation as? [[String: Any]] {
            for itemRepresentation in representation {
                
                if let item = Self(response: response, representation: itemRepresentation) {
                    collection.append(item)
                }
            }
        }
        
        return collection
    }
}

struct ErrorResponse : Error{
    
    var status:Int
    var error:String
    var message:String
    var errorDescription:String
    
    init(dictionaryObj:NSDictionary){
        self.status = dictionaryObj["status"] as? Int ?? 0
        self.error = "\(dictionaryObj["error"] ?? "")"
        self.message = "\(dictionaryObj["message"] ?? "")"
        self.errorDescription = "\(dictionaryObj["error_description"] ?? "")"
    }
    
    init(){
        self.status = 0
        self.error = ""
        self.message = ""
        self.errorDescription = ""
    }
    
    init(status: Int, error: String, message: String, errorDescription: String){
        self.status = status
        self.error = error
        self.message = message
        self.errorDescription = errorDescription
    }
}

