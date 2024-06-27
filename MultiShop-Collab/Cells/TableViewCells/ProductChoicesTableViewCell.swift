//
//  ProductChoicesTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

protocol ProductChoicesTblCellDelegate{
    func didAddToCart()
}

class ProductChoicesTableViewCell: UITableViewCell {

    var count = 0
    var product: Product!
    var quantity: String = "1"
    
    var delegate:ProductChoicesTblCellDelegate!
    
    
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet var btnSizes: [UIButton]!
    @IBOutlet var btnColors: [UIButton]!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var lblQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stepper.autorepeat = true
        stepper.isContinuous = true
        
        lblQuantity.text = stepper.value.description
        
        for colorBtn in btnColors {
            colorBtn.layer.borderColor = UIColor.systemGray.cgColor
            colorBtn.layer.borderWidth = 1.0
            colorBtn.layer.cornerRadius = 8.0
            colorBtn.tag = count
            colorBtn.addTarget(self, action: #selector(onColorBtnPressed), for: .touchUpInside)
            count += 1
        }
        
        for sizeBtn in btnSizes {
            sizeBtn.layer.borderColor = UIColor.systemGray.cgColor
            sizeBtn.layer.borderWidth = 1.0
            sizeBtn.layer.cornerRadius = 8.0
            sizeBtn.tag = count
            sizeBtn.addTarget(self, action: #selector(onSizeBtnPressed), for: .touchUpInside)
            count += 1
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func stepperValueChange(_ sender: UIStepper) {
        lblQuantity.text = sender.value.description
        quantity = sender.value.description
    }
// MARK: - All objc methods
    @objc func onColorBtnPressed(_ sender:UIButton){
        for colorBtn in btnColors {
            if sender.tag == colorBtn.tag{
                colorBtn.layer.borderColor = UIColor.systemYellow.cgColor
                colorBtn.backgroundColor = .systemYellow
            }else{
                colorBtn.layer.borderColor = UIColor.systemGray.cgColor
                colorBtn.backgroundColor = .systemBackground
            }
        }
    }
    
    @objc func onSizeBtnPressed(_ sender: UIButton){
        for sizeBtn in btnSizes {
            if sender.tag == sizeBtn.tag{
                sizeBtn.layer.borderColor = UIColor.systemYellow.cgColor
                sizeBtn.backgroundColor = .systemYellow
            }else{
                sizeBtn.layer.borderColor = UIColor.systemGray.cgColor
                sizeBtn.backgroundColor = .systemBackground
            }
        }
    }
    
    @IBAction func onAddToCartBtnPressed(_ sender: Any) {
        
        let price = product.price.convertToInt()
        
        let userCartProduct = Cart(productName: product.title, productImage: product.image, productQuantity: quantity.convertToInt() , productStatus: "Available", productPrice: price)
        
        print("userCartProduct: ", userCartProduct)
        
        OrderDataUser.userCartArr.append(userCartProduct)
        delegate.didAddToCart()
    }
    
}
