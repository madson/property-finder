//
//  property_finderTests.swift
//  property-finderTests
//
//  Created by Madson on 3/31/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import XCTest
import Alamofire

@testable import property_finder

class APIClientTests: XCTestCase {

    // xtest = disabled test
    func xtestRequestSearchEndpoint() {
        let session = SessionManager()
        let api = APIClient(sessionManager: session)
        
        let expectation = self.expectation(description: "wait http response")
        
        api.request(path: "/search", parameters: nil, headers: nil, method: .get) { (result) in
            switch result {
            case .success(let data):
                print(data)
                expectation.fulfill()
            case .failure(let error):
                print(error)
                expectation.fulfill()
            }
        }
        
        self.waitForExpectations(timeout: 3) { (error) in
            print(error?.localizedDescription ?? "")
        }
    }

}
