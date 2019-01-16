//
//  RestaurantDataSource.swift
//  CollectionViewSearching
//
//  Created by Simon Mc Neil on 2018-04-05.
//  Copyright © 2018 Simon Mc Neil. All rights reserved.
//

import UIKit

class RestaurantDataSource: NSObject, UICollectionViewDataSource {
    
    private var filteredObjects: [Restaurant] = []
    private var objects: [Restaurant] = []
    private var isFiltering: Bool = false
    
    func fill() {
        objects = [Restaurant(title: "Bru Restaurant", address: "2281 Adirondak Trail, Oakvile, Ontario", image: UIImage(named: "1.jpg")!),
                   Restaurant(title: "Season Restaurant", address: "8911 Toy Station Suite 899", image: UIImage(named: "2.jpg")!),
                   Restaurant(title: "Maluca", address: "2314 Thorncrest Cres. Oakville, Ontario", image: UIImage(named: "3.jpg")!),
                   Restaurant(title: "OFinns Iresh Temper", address: "96 Bay Ottawa Ontario", image: UIImage(named: "4.jpg")!),
                   Restaurant(title: "King's Arms", address: "19 West Oak Trails, Oakville Ontario", image: UIImage(named: "5.jpg")!),
                   Restaurant(title: "Green Room", address: "51st Avenue King Street West, Toronto, Ontario", image: UIImage(named: "6.jpg")!),
                   Restaurant(title: "Plank", address: "29 Bathrust Street, Toronto, Ontario", image: UIImage(named: "7.jpg")!),
                   Restaurant(title: "Firehall", address: "8912 Toy Station Suite 899, Kingston, Ontario", image: UIImage(named: "8.jpg")!),
                   Restaurant(title: "Gucci", address: "1211 Roy Station Drive 899, Ottawa, Ontario", image: UIImage(named: "9.jpg")!)]
    }
    
    //Filter method
    func filter(searchTerm: String) {
        if searchTerm.isEmpty {
            isFiltering = false
            filteredObjects.removeAll()
        } else {
            isFiltering = true
            
            filteredObjects = objects.filter({
                return $0.title.localizedCaseInsensitiveContains(searchTerm)
            })
        }
    }
    
    func object(indexPath: IndexPath) -> Restaurant {
        //If we are filtering then return the objcet from the filtered objcet
        if isFiltering {
            return filteredObjects[indexPath.item]
        } else {
            return objects[indexPath.item] //if not then just return the objcet from itself
        }
    }
    
    // MARK: - Collectionview Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredObjects.count
        } else {
            return objects.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RestaurantsCell
        
        let restaurantInfo = object(indexPath: indexPath)
        cell.putCellInfo(restaurant: restaurantInfo) //calls putCellInfo in the RestaurantCell class to set the IBOutlets value for each total cell count
        
        /*Creates the shadow effect, cell spacing, and final details. Remember to add a background color
         for the cell in the storyboard, if not the shadown effect is visible in the entire card. */
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
}
