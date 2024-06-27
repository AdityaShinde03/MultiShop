//
//  ContactDetailsTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 26/06/24.
//

import UIKit

class ContactDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbUserName: UILabel!
    
    @IBOutlet weak var lbUserEmail: UILabel!
    
    @IBOutlet weak var lbPhoneNumber: UILabel!
    
    @IBOutlet weak var lbAddress: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
