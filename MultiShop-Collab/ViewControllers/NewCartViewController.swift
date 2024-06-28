//
//  NewCartViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 28/06/24.
//

import UIKit

class cartTBVC: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var lbQty: UILabel!
    
    @IBOutlet weak var productStatus: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var btnMinus: UIButton!
    
    @IBOutlet weak var btnPlus: UIButton!
    
    @IBOutlet weak var viewQuantity: UIView!
    
}

class NewCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var CartTableView: UITableView!
    
    var cartData: [Cart] = [
    
        Cart(productId: 1, productName: "Shoes", productImage: "product-1", productQuantity: 1, productStatus: "Available", productPrice: 23),
        Cart(productId: 1, productName: "Shoes", productImage: "product-1", productQuantity: 1, productStatus: "Available", productPrice: 23),
        Cart(productId: 1, productName: "Shoes", productImage: "product-1", productQuantity: 1, productStatus: "Available", productPrice: 23),
        Cart(productId: 1, productName: "Shoes", productImage: "product-1", productQuantity: 1, productStatus: "Available", productPrice: 23),
        Cart(productId: 1, productName: "Shoes", productImage: "product-1", productQuantity: 1, productStatus: "Available", productPrice: 23),
        Cart(productId: 1, productName: "Shoes", productImage: "product-1", productQuantity: 1, productStatus: "Available",
             productPrice: 23),
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        CartTableView.delegate = self
        CartTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CartTableView.dequeueReusableCell(withIdentifier: "cartTBVC", for: indexPath) as! cartTBVC
        
        let index = indexPath.row
        
        cell.selectionStyle = .none
        cell.productImage.image = UIImage(named: cartData[index].productImage!)
        cell.productName.text = cartData[index].productName
        cell.productPrice.text = "$"+"\(cartData[index].productPrice ?? 0)"
        cell.productStatus.text = cartData[index].productStatus
        cell.lbQty.text = "\(cartData[index].productQuantity ?? 1)"
        cell.viewQuantity.applyCornerRadius(radius: 5)
        cell.viewQuantity.layer.borderWidth = 1
        cell.viewQuantity.layer.borderColor = UIColor(resource: .appGray).cgColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146
    }


}
