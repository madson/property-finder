//
//  ViewController.swift
//  property-finder
//
//  Created by iOS Developer on 3/31/19.
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
        collectionView.contentInset = UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
                
        fetchProperties(for: self.page, sort: nil)
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

    func fetchProperties(for page: Int, sort: SortOption?) {
        DataRequest.addAcceptableImageContentTypes(["image/jpeg", "image/jpg"])

        searchClient.properties(for: self.page, sort: sort) { (properties) in
            self.properties += properties
            self.adapter.performUpdates(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? SortViewController {
            viewController.delegate = self
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

extension ViewController: SortViewControllerDelegate {
    func didSelectSortOption(sort: SortOption) {
        self.page = 1
        self.properties = []
        self.adapter.performUpdates(animated: true)
        fetchProperties(for: self.page, sort: sort)
    }
}
