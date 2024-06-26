//
//  CategoriesCollectionViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        categoryView.layer.cornerRadius = 9.0
        categoryView.clipsToBounds = true
        
        categoryView.layer.borderWidth = 1.0
        categoryView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
