//
//  YourOrderTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 26/06/24.
//

import UIKit

protocol ProfileViewDelegate {
    func showOrders()
    func logout()
}

class YourOrderTableViewCell: UITableViewCell {

    var delegateToViewOrders : ProfileViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionViewOrders(_ sender: Any) {
        delegateToViewOrders.showOrders()
    }
    

}
