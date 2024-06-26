//
//  OrderListingTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class OrderListingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var lbProductName: UILabel!
    @IBOutlet weak var lbOrderDate: UILabel!
    
    @IBOutlet weak var lbDeliveryDate: UILabel!
    
    @IBOutlet weak var DeliveryAddress: UILabel!
    
    @IBOutlet weak var lbOrderStatus: UILabel!
    
    @IBOutlet weak var lbProductQuantity: UILabel!
    
    var productStatus: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        lbOrderStatus.applyCornerRadius(radius: 5)
        
        if productStatus == "Pending"{
            lbOrderStatus.backgroundColor = UIColor(named: "OrderPendin")
            
        }else if productStatus == "Dispatched"{
            lbOrderStatus.backgroundColor = UIColor(named: "OrderDispatches")
        }else {
            lbOrderStatus.backgroundColor = UIColor(named: "OrderDelivers")
        }
    }

}
