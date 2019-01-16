//
//  RestaurantNavigationController.swift
//  CollectionViewSearching
//
//  Created by Simon Mc Neil on 2018-04-05.
//  Copyright © 2018 Simon Mc Neil. All rights reserved.
//

import UIKit


/* MARK: - All this controller simply does is give our navigation controller status bar a default style for our
           app. We override this to another default style in the RestaurantViewController class*/
class RestaurantNavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController!.preferredStatusBarStyle
    }
}
