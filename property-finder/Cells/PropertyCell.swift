//
//  PropertyCell.swift
//  property-finder
//
//  Created by iOS Developer on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import UIKit
import AlamofireImage

final class PropertyCell: UICollectionViewCell {
    static let reuseIdentifier = "PropertyCell"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 6
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.thumbnailImageView.image = nil
    }

    func setup(property: Property) {
        if let bedrooms = property.bedrooms, let bathrooms = property.bathrooms {
            descriptionLabel.text = "\(bedrooms) beedrooms, \(bathrooms) bathrooms"
        }
        
        if let price = property.price, let priceCurrency = property.priceLabel {
            priceLabel.text = "\(price) \(priceCurrency)"
        }
        
        if let thumbnail = property.thumbnail {
            let url = URL(string: thumbnail)!
            thumbnailImageView.af_setImage(withURL: url)
        }
    }
}
