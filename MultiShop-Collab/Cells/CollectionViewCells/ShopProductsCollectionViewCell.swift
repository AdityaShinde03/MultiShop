//
//  ShopProductsCollectionViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class ShopProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblProductTitle: UILabel!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productView.layer.cornerRadius = 3.0
        productView.clipsToBounds = true
        
        productView.layer.borderColor = UIColor.lightGray.cgColor
        productView.layer.borderWidth = 1.0
        
        productView.dropShadow()
        
    }
}
