//
//  ProductChoicesTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class ProductChoicesTableViewCell: UITableViewCell {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var lblQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stepper.autorepeat = true
        stepper.isContinuous = true
        
        lblQuantity.text = stepper.value.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperValueChange(_ sender: UIStepper) {
        lblQuantity.text = sender.value.description
        
    }
}
