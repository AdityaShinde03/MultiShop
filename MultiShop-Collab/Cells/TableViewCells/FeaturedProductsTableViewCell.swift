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

    var productsArr  = [
        Product(title: "Camera", image: "product-1", price: "123.00"),
        Product(title: "T-shirt", image: "product-2", price: "100.00"),
        Product(title: "Lamp", image: "product-3", price: "153.00"),
        Product(title: "Shoes", image: "product-4", price: "60.00"),
        Product(title: "Drone", image: "product-5", price: "150.00"),
        Product(title: "Watch", image: "product-6", price: "15.00"),
        Product(title: "Dress", image: "product-7", price: "99.00"),
        Product(title: "Cosmetics", image: "product-8", price: "300.00"),
        Product(title: "Chair", image: "product-9", price: "200.00"),
    ]
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

// MARK: Extensions
extension FeaturedProductsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productsCollectionCell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProductsCollectionViewCell", for: indexPath) as!  FeaturedProductsCollectionViewCell
        
        let singleProduct = productsArr[indexPath.item]
        
        productsCollectionCell.productImg.image = UIImage(named: singleProduct.image)
        productsCollectionCell.lblProductName.text = singleProduct.title
        productsCollectionCell.lblProductPrice.text = "$\(singleProduct.price)"
        return productsCollectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productsCollectionView.frame.width/2 - 6, height: 300)
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
