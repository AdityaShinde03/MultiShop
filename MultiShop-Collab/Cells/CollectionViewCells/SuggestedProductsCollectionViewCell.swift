//
//  SuggestedProductsCollectionViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class SuggestedProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productView.layer.cornerRadius = 9.0
        productView.clipsToBounds = true
        
        productView.layer.borderColor = UIColor.lightGray.cgColor
        productView.layer.borderWidth = 1.0
    }
}
