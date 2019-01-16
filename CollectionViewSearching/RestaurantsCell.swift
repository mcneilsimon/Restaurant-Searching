//
//  RestaurantsCell.swift
//  CollectionViewSearching
//
//  Created by Simon Mc Neil on 2018-04-05.
//  Copyright © 2018 Simon Mc Neil. All rights reserved.
//

import UIKit

class RestaurantsCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 4.0
    }
    
    func putCellInfo(restaurant: Restaurant) {
        //mixed up added address and title text label
        titleLabel.text = restaurant.address
        addressLabel.text = restaurant.title
        imageView.image = restaurant.image
    }
    
}
