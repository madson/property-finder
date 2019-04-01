//
//  SearchClient.swift
//  property-finder
//
//  Created by iOS Developer on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import Foundation
import Alamofire

struct SearchClient {
    let sessionManager = SessionManager()

    func properties(for page: Int, sort: SortOption?, completion: @escaping ([Property]) -> Void) {
        var params = [String: String]()
        params["page"] = "\(page)"
        
        if let sort = sort {
            params["ob"] = sort.toStringParameter
        }
        
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
