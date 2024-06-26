//
//  DynamicHeightCollectionView.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {

    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size,self.intrinsicContentSize){
          self.invalidateIntrinsicContentSize()
        }
      }
      override var intrinsicContentSize: CGSize {
        return contentSize
      }

}
