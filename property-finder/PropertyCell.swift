//
//  PropertyCell.swift
//  property-finder
//
//  Created by Madson on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import UIKit

final class PropertyCell: UICollectionViewCell {
    static let reuseIdentifier = "PropertyCell"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setup(property: Property) {
        if let bedrooms = property.bedrooms, let bathrooms = property.bathrooms {
            descriptionLabel.text = "\(bedrooms) beedrooms, \(bathrooms) bathrooms"
        }
        if let price = property.price, let priceCurrency = property.priceLabel {
            priceLabel.text = "\(price) \(priceCurrency)"
        }
    }
}
