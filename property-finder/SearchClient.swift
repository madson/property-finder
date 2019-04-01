//
//  SearchClient.swift
//  property-finder
//
//  Created by Madson on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import Foundation
import Alamofire

struct SearchClient {
    let sessionManager = SessionManager()

    func properties(for page: Int, completion: @escaping ([Property]) -> Void) {
        let params = ["page" : "\(page)"]
        let api = APIClient(sessionManager: sessionManager)

        api.request("/search", parameters: params, headers: nil, method: .get) { (result: APIResult<SearchResponse>) in
            switch result {
            case .success(let data):
                if let properties = data.res {
                    completion(properties)
                } else {
                    completion([])
                }
                break
            case .failure:
                completion([])
                break
            }
            
        }
    }
}
