//
//  FeaturedProductsTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit


protocol productsCollectionViewDelegate {
    func didSelectProduct(at index: IndexPath)
}

class FeaturedProductsTableViewCell: UITableViewCell {
    
    var delegate:productsCollectionViewDelegate!

    var productsImages = ["product-1","product-2","product-3","product-4","product-5","product-6","product-7","product-8","product-9"]

    @IBOutlet weak var productsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        self.productsCollectionView.layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension FeaturedProductsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productsCollectionCell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductsCollectionViewCell", for: indexPath) as!  FeaturedProductsCollectionViewCell
        
        productsCollectionCell.productImg.image = UIImage(named: productsImages[indexPath.item])
        
        return productsCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productsCollectionView.frame.width/2 - 6, height: 340)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate.didSelectProduct(at: indexPath)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 8
    }
}
