//
//  APIClient.swift
//  property-finder
//
//  Created by Madson on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import Foundation
import Alamofire

enum Method: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

enum Errors: Error {
    case networking(Int), unknown, wrongFormat
}

final class APIClient {
    private let sessionManager: SessionManager
    private let basepath = "https://www.propertyfinder.ae/mobileapi"
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func request(path: String,
                 parameters: [String : Any]?,
                 headers: [String : String]?,
                 method: Method,
                 completion: @escaping (Result<[String : Any]>) -> Void) {
        
        let fullPath = "\(basepath)\(path)"
        let url = URL(string: fullPath)!
        let method = Alamofire.HTTPMethod(rawValue: method.rawValue)!
        let encoding = JSONEncoding()
        
        sessionManager
            .request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseJSON { response in
                
                switch response.result {
                case .success(let data):
                    if let json = data as? [String : Any] {
                        completion(.success(json))
                    } else {
                        completion(.failure(Errors.wrongFormat))
                    }
                    break
                    
                case .failure:
                    if let statusCode = response.response?.statusCode {
                        completion(.failure(Errors.networking(statusCode)))
                    } else {
                        completion(.failure(Errors.unknown))
                    }
                }
        }
    }
}
