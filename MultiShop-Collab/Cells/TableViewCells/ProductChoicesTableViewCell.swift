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
    var pId:Int = 0
    var quantity: String = "1"
    
    var delegate:ProductChoicesTblCellDelegate!
    
    
    @IBOutlet weak var btnAddToCart: UIButton!
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
        print("Product from singleton",OrderDataUser.Products[pId])
        if OrderDataUser.Products[pId].isAddedToCart == true {
            btnAddToCart.isEnabled = false
            btnAddToCart.setTitle("Added to Cart", for: .disabled)
        }else{
            btnAddToCart.isEnabled = true
            btnAddToCart.setTitle("Add to Cart", for: .normal)
        }
        

    }

    @IBAction func stepperValueChange(_ sender: UIStepper) {
        lblQuantity.text = sender.value.description
        quantity = sender.value.description
    }
// MARK: - All objc methods
    @objc func onColorBtnPressed(_ sender:UIButton){
        for colorBtn in btnColors {
            if sender.tag == colorBtn.tag{
                colorBtn.layer.borderColor = UIColor(named: "systemGray5")?.cgColor
                colorBtn.backgroundColor = .systemGray5
                colorBtn.layer.borderColor = .none
            }else{
                colorBtn.layer.borderColor = UIColor.systemGray.cgColor
                colorBtn.backgroundColor = .systemBackground
            }
        }
    }
    
    @objc func onSizeBtnPressed(_ sender: UIButton){
        for sizeBtn in btnSizes {
            if sender.tag == sizeBtn.tag{
                sizeBtn.layer.borderColor = UIColor(named: "systemGray5")?.cgColor
                sizeBtn.backgroundColor = .systemGray5
                sizeBtn.layer.borderColor = .none
            }else{
                sizeBtn.layer.borderColor = UIColor.systemGray.cgColor
                sizeBtn.backgroundColor = .systemBackground
            }
        }
    }
    
    @IBAction func onAddToCartBtnPressed(_ sender: UIButton) {
        
        let price = product.price.convertToInt()
        OrderDataUser.Products[pId].isAddedToCart = true
        
        let userCartProduct = Cart(productId: pId,productName: product.title, productImage: product.image, productQuantity: quantity.convertToInt() , productStatus: "Available", productPrice: price)
        
        print("userCartProduct: ", userCartProduct)
        
        OrderDataUser.userCartArr.append(userCartProduct)
        
        sender.isEnabled = false
        sender.setTitle("Added to Cart", for: .disabled)
        
        delegate.didAddToCart()
    }
    
}
