//
//  SortViewController.swift
//  property-finder
//
//  Created by iOS Developer on 4/1/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import UIKit

enum SortOption: String {
    case priceDescending, priceAscending, bedsDescending, bedsAscending
    
    var toStringParameter: String {
        switch self {
        case .priceDescending:
            return "pd"
        case .priceAscending:
            return "pa"
        case .bedsDescending:
            return "bd"
        case .bedsAscending:
            return "ba"
        }
    }
}

protocol SortViewControllerDelegate {
    func didSelectSortOption(sort: SortOption)
}

final class SortViewController: UIViewController {
    
    private var currentChoice: String?
    var delegate: SortViewControllerDelegate?
    
    // MARK: - Buttons actions
    
    @IBAction func priceDescendingDidTap() {
        guard let delegate = delegate else { return }
        delegate.didSelectSortOption(sort: .priceDescending)
    }

    @IBAction func priceAscendingDidTap() {
        guard let delegate = delegate else { return }
        delegate.didSelectSortOption(sort: .priceAscending)
    }

    @IBAction func bedsDescendingDidTap() {
        guard let delegate = delegate else { return }
        delegate.didSelectSortOption(sort: .bedsDescending)
    }

    @IBAction func bedsAscendingDidTap() {
        guard let delegate = delegate else { return }
        delegate.didSelectSortOption(sort: .bedsAscending)
    }

}
