//
//  CartTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    // MARK: - IB OUTLETs
    
    // Views
    @IBOutlet weak var cellView: UIView!
    
    
    //Labels
    @IBOutlet weak var lbStatus: UILabel!
    
    @IBOutlet weak var lbPrice: UILabel!
    
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var lbQty: UILabel!
    
    //Btns
    @IBOutlet weak var btnPlus: UIButton!
    
    @IBOutlet weak var btnMinus: UIButton!
    
    // Image View
    
    @IBOutlet weak var imageProduct: UIImageView!
    
    @IBOutlet weak var viewQuantity: UIView!
    
    
    
    var delegate : QuantityDelegate!
    
    var btnIsDisabled: Bool = false
    //var productStatus = "Available"
    
    // MARK: - Table View Cell Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
//        if productStatus == "Available" {
//            lbStatus.backgroundColor = .statusAvailable
//            
//        }else {
//            btnPlus.isEnabled = false
//            btnMinus.isEnabled = false
//            lbStatus.backgroundColor = .statusNotAvailable
//        }
//        
//        lbStatus.text = productStatus
    }
    
    // MARK: - IB Actions
    @IBAction func actionPlus(_ sender: UIButton) {
        
        delegate.addQuantity(index: sender.tag - 1)
        //print("clicked", sender.tag)
    }
    
    @IBAction func actionMinus(_ sender: UIButton) {
        delegate.substractQuantity(index: sender.tag - 1)
    }
    

    
    

}
