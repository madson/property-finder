//
//  Property.swift
//  property-finder
//
//  Created by iOS Developer on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import Foundation
import IGListKit

class Property: Codable {
    var id: Int!
    var price: String?
    var priceLabel: String?
    var thumbnail: String?
    var bedrooms: String?
    var bathrooms: String?
    
    enum CodingKeys: String, CodingKey {
        case id, price, thumbnail, bedrooms, bathrooms, priceLabel = "price_label"
    }

}

extension Property: Equatable {
    static public func ==(rhs: Property, lhs: Property) -> Bool {
        return rhs.id == lhs.id
    }
}

extension Property: ListDiffable {
    
    public func diffIdentifier() -> NSObjectProtocol {
        return NSNumber(value: id)
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Property else {
            return false
        }
        
        if id != object.id {
            return false
        }
        
        return self == object
    }
}
