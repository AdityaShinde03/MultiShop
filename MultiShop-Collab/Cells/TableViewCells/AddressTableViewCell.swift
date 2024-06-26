//
//  AddressTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var addressIcon: UIImageView!
    @IBOutlet weak var lbAddressType: UILabel!
    
    var typeOfAddress = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if typeOfAddress == "Home"{
            addressIcon.image = UIImage(named: "home")
        }else if typeOfAddress == "Office" {
            addressIcon.image = UIImage(named: "office-building")
        }else {
            addressIcon.image = UIImage(named: "location")
        }
        
    }

}
