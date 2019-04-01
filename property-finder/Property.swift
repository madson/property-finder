//
//  Property.swift
//  property-finder
//
//  Created by Madson on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import Foundation

struct Property: Codable {
    var id: Int?
    var price: String?
    var priceLabel: String?
    var thumbnail: String?
    var bedrooms: String?
    var bathrooms: String?
    
    enum CodingKeys: String, CodingKey {
        case id, price, thumbnail, bedrooms, bathrooms, priceLabel = "price_label"
    }

}
