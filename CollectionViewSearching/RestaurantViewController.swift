//
//  RestaurantViewController.swift
//  CollectionViewSearching
//
//  Created by Simon Mc Neil on 2018-04-04.
//  Copyright © 2018 Simon Mc Neil. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchBarTopConstraint: NSLayoutConstraint!
    
    var presenter: RestaurantsPresenter!
    

    // MARK: - View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gives the header title
        title = "Restaurants"
 
        setup()

        
        //Fills an array of data with restaurant information inside teh RestaurantDataSourceClass
        presenter.fill()
        collectionView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func setup() {
        searchBar.placeholder = "Search"
        presenter = RestaurantsPresenter(viewController: self)
        searchBar.delegate = presenter
        
        collectionView.dataSource = presenter.dataSource
        collectionView.delegate = presenter
        
        searchBarTopConstraint.constant = 0.0
        addCollectionViewObserver()
    }
    
    /*  MARK: - The following three func are used to prevent the header from being on top of the search bar
        when user reaches the top and decided to keep scrolling up. Example doing an app refresh. They
        are also used to add constraints through code instead of in the story board for the search bar */
    func addCollectionViewObserver() {
        collectionView.addObserver(self, forKeyPath: "contentOffset", options: [.new, .old], context: nil)
    }
    
    //Adding observer value method
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let collectionView = object as? UICollectionView {
            searchBarTopConstraint.constant = -1 * collectionView.contentOffset.y
        }
    }
    
    //deinit in order to remove the observer
    deinit {
        collectionView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    
    func reloadView() {
        collectionView.reloadData()
    }
    
    /* override the status bar style that we created in the RestaurantNavigationController, with the default style light content */
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}















