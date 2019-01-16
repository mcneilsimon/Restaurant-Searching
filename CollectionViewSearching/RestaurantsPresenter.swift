//
//  RestaurantsPresenter.swift
//  CollectionViewSearching
//
//  Created by Simon Mc Neil on 2018-04-05.
//  Copyright © 2018 Simon Mc Neil. All rights reserved.
//

import UIKit

/* UICollectionFlowLayout lets us decide the size and space between cells */
class RestaurantsPresenter: NSObject, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //we declare it weak to take care of memory issues
    weak var viewController: RestaurantViewController?
    
    //we put the datasource in the presenter because it makes the calls easier
    let dataSource: RestaurantDataSource = RestaurantDataSource()

    init(viewController: RestaurantViewController?) {
        super.init()
        self.viewController = viewController
    }
    
    func fill() {
        dataSource.fill()
    }
    
    // MARK: - UISearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        dataSource.filter(searchTerm: searchText)
        viewController?.reloadView()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
        dataSource.filter(searchTerm: "")
        viewController?.reloadView()

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    //gives us the space between cells horizontally
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //sets are edge insets value to later create padding around the cells (below function)
        
        /* viewController?.searchBar.frame.height makes sure that are search bar doesn't cover part of the
         collection view cells, like how we see it in the storyboard */
        return UIEdgeInsets(top: (viewController?.searchBar.frame.height ?? 0.0) + 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    //lets us decide the size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let edgeInsets = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        
        //creates padding between the cells
        return CGSize(width: collectionView.frame.width - edgeInsets.left - edgeInsets.right, height: 92.0)
    }

}
