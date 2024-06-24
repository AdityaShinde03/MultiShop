//
//  PoliciesCollectionViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class PoliciesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var policyView: UIView!
    @IBOutlet weak var policyImg: UIImageView!
    @IBOutlet weak var lblPolicyTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        policyView.layer.cornerRadius = 9.0
        policyView.clipsToBounds = true
    }
}
