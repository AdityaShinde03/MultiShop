//
//  PlaceOrderTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class PlaceOrderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbTotalProducts: UILabel!
    
    @IBOutlet weak var lbPaymentAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func actionPlaceOrder(_ sender: Any) {
        
    }
    

}
