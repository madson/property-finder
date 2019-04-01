//
//  ViewController.swift
//  property-finder
//
//  Created by Madson on 3/31/19.
//  Copyright © 2019 Property Finder. All rights reserved.
//

import UIKit
import IGListKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    private var page = 1
    private let searchClient = SearchClient()

    var properties: [Property] = []
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        fetchProperties()
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

    func fetchProperties(for query: String? = nil) {
        searchClient.properties(for: self.page) { (properties) in
            self.properties += properties
            self.adapter.performUpdates(animated: true)
        }
    }
}

extension ViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.properties
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = PropertySectionController()
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }
}
