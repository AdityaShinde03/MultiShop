//
//  LogoutTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 26/06/24.
//

import UIKit

class LogoutTableViewCell: UITableViewCell {

    var delegateToLogout : ProfileViewDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionLogout(_ sender: Any) {
        delegateToLogout.logout()
    }
    

}
