//
//  ProductDisplayTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

protocol ProductDisplayDelegate{
    func didSelectImage(product: Product)
}

class ProductDisplayTableViewCell: UITableViewCell {
    
    var delegate: ProductDisplayDelegate!
    var product: Product!
    var totalCount = 5

    var currentPage = 0
    
    var timer = Timer()

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var productDisplayCollectionViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pageControl.numberOfPages = totalCount
        pageControl.currentPage = 0
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(automaticScrollImage), userInfo: nil, repeats: true)
        
        productDisplayCollectionViewCell.delegate = self
        productDisplayCollectionViewCell.dataSource = self

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func automaticScrollImage() {
        
        if currentPage < totalCount {
                  let index = IndexPath.init(item: currentPage, section: 0)
                  self.productDisplayCollectionViewCell.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
                  pageControl.currentPage = currentPage
                  currentPage += 1
             } else {
                  currentPage = 0
                  let index = IndexPath.init(item: currentPage, section: 0)
                  self.productDisplayCollectionViewCell.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
                   pageControl.currentPage = currentPage
                   currentPage = 1
               }
        
    }

}


extension ProductDisplayTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productDisplayCell = productDisplayCollectionViewCell.dequeueReusableCell(withReuseIdentifier: "ProductDisplayCollectionViewCell", for: indexPath) as! ProductDisplayCollectionViewCell
        
        productDisplayCell.productImg.image = UIImage(named: product.image)
        
        return productDisplayCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: productDisplayCollectionViewCell.frame.width, height: productDisplayCollectionViewCell.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate.didSelectImage(product: self.product)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
        pageControl.currentPage = currentPage
    }
}
