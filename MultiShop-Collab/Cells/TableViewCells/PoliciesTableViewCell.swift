//
//  PoliciesTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class PoliciesTableViewCell: UITableViewCell {

    var policiesIcons = ["check-2","free-delivery","return-box","phone-2"]
    var policiesTitles = ["Quality Product","Free Shipping","14-Day Return","24/7 Support"]

    @IBOutlet weak var policiesCollectioinView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        policiesCollectioinView.delegate = self
        policiesCollectioinView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension PoliciesTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return policiesTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let policyCollectionCell = policiesCollectioinView.dequeueReusableCell(withReuseIdentifier: "PoliciesCollectionViewCell", for: indexPath) as! PoliciesCollectionViewCell
        
        policyCollectionCell.policyImg.image = UIImage(named: policiesIcons[indexPath.item])
        policyCollectionCell.lblPolicyTitle.text = policiesTitles[indexPath.item]
        
        return policyCollectionCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
}
