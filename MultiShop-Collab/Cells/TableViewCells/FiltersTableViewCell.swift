//
//  FiltersTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class FiltersTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBoxBtn: CheckBox!
    @IBOutlet weak var lblFilterText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}