//
//  ProductDisplayTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class ProductDisplayTableViewCell: UITableViewCell {
    
    var product: Product!

    var currentPage = 0

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var productDisplayCollectionViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productDisplayCollectionViewCell.delegate = self
        productDisplayCollectionViewCell.dataSource = self
        
        pageControl.numberOfPages = 5

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    


}


extension ProductDisplayTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productDisplayCell = productDisplayCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "ProductDisplayCollectionViewCell", for: indexPath) as! ProductDisplayCollectionViewCell
        
        productDisplayCell.productImg.image = UIImage(named: product.image)
        
        return productDisplayCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productDisplayCollectionViewCell.frame.width, height: productDisplayCollectionViewCell.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
        pageControl.currentPage = currentPage
    }
}
