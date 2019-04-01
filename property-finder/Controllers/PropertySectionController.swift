//
//  PropertySectionController.swift
//  property-finder
//
//  Created by iOS Developer on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import Foundation
import IGListKit

class PropertySectionController: ListSectionController {
    var property: Property?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    }
}

extension PropertySectionController {
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 300, height: 250)
    }
        
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let nibName = PropertyCell.reuseIdentifier
        let bundle = Bundle.main
        let cell = collectionContext!.dequeueReusableCell(withNibName: nibName, bundle: bundle, for: self, at: index)
        
        if let cell = cell as? PropertyCell, let property = self.property {
            cell.setup(property: property)
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        property = object as? Property
    }
    
}
