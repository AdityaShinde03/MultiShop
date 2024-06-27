//
//  FeaturedProductsCollectionViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class FeaturedProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productView.layer.cornerRadius = 9.0
        productView.clipsToBounds = true
        
        productView.layer.borderColor = UIColor.lightGray.cgColor
        productView.layer.borderWidth = 1.0
    }
}
