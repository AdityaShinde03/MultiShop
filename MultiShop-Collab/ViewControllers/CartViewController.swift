//
//  CartViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit



class CartViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    //HeaderView Table View
    //@IBOutlet weak var btnBack: UIButton!
    
    // TableView
    @IBOutlet weak var CartTableView: UITableView!
    
    // FooterView Table View
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var btnProceedToCheckout: UIButton!
    
    // MARK: - Cart Data
    var productData = ["Shoes": 45, "T-shirt": 45, "Lamp": 30, "Drones": 100, "Speaker": 80] as [String: Any]
    
    var productImages = ["product-1","product-2","product-3","product-4","product-5","product-6","product-7","product-8","product-9"]
    var productStatus = ["Available","Not Available","Available","Available","Available","Available","Not Available","Available","Available"]
    var productName = ["Speaker","T-Shirt","Lamp","Shoes","Drone","Watch","Black-Shirt","Foundation","Chair"]
    var productPrice = [45,45,30,100,80, 45,45,30,100]
    var productQuantity = [1,1,1,1,1,1,1,1,1]
    
    var cartData = [] as [Cart]
    var totalPayableAmount: String!
    
    // Products in Cart with Available Status.
    var totalProductsInCart : Int!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CartTableView.delegate = self
        CartTableView.dataSource = self
        
        print("productData.keys: ", productData.keys )
        print("productData.values: ", productData.values)
        
//        productName = productData.keys
//        productPrice = productData.values
        
        
        
        setupUI()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupData()
    }
    
    // MARK: - IB Actions
    
    @IBAction func actionProceedToCheckout(_ sender: Any) {
        if totalProductsInCart > 0 {
            moveToCheckOut()
        }else{
            alertUser(message: "Empty Cart")
        }
    }
    

}



// MARK: - All Extensions
extension CartViewController {
    func setupUI(){
        //btnBack.makeCircle()
        CartTableView.showsVerticalScrollIndicator = false
    }
    
    func setupData(){
        print("cart: ", OrderDataUser.userCartArr)
        cartData = OrderDataUser.userCartArr
        showQuantityTotal()
        CartTableView.reloadData()
    
    }
    
    func moveToCheckOut(){
        let checkout = self.storyboard?.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
        checkout.totalAmount = totalPayableAmount
        checkout.totalProduct = "\(totalProductsInCart!)"
        checkout.cartData = cartData
        self.navigationController?.pushViewController(checkout, animated: true)
    }
}

// MARK: - Table View Delegates Extensions
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        
        let index = indexPath.row
        let cartProduct = cartData[index]
        cell.delegate = self
        
        cell.btnPlus.tag = indexPath.row + 1
        cell.btnMinus.tag = indexPath.row + 1
        
        cell.imageProduct.image = UIImage(named: cartProduct.productImage!)
    
        cell.lbName.text = cartProduct.productName
        cell.lbPrice.text = "$\(cartProduct.productPrice ?? 0)"
        cell.lbStatus.applyCornerRadius(radius: 6.0)
        
        if cartProduct.productStatus == "Available" {
            cell.lbStatus.backgroundColor = UIColor(named: "StatusAvailable")
        }else {
            cell.lbStatus.backgroundColor = UIColor(named: "StatusNotAvailable")
        }
        
        cell.lbStatus.text = cartProduct.productStatus
        cell.lbQty.text = "\(cartProduct.productQuantity!)"
        //cell.isAvailable = productStatus[index]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 159
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeData = UIContextualAction(style: .destructive, title: "Remove from Cart") { (action,view,completionHandler ) in
            self.cartData.remove(at: indexPath.row)
            self.showQuantityTotal()
            self.CartTableView.reloadData()
        }
        
        let config = UISwipeActionsConfiguration(actions: [removeData])

            return config
    }
}

// MARK: - Quantity Delegate Protocol Extension
extension CartViewController : QuantityDelegate {
    func addQuantity(index: Int) {
        cartData[index].productQuantity! += 1
        showQuantityTotal()
        CartTableView.reloadData()
    }
    
    func substractQuantity(index: Int) {
        if cartData[index].productQuantity! > 0{
            cartData[index].productQuantity! -= 1
            showQuantityTotal()
            CartTableView.reloadData()
            
        }else{
            alertUser(message: "Quantity Must be Greater Than Zero")
        }
    }
    
    func showQuantityTotal(){
        var total = 0
        totalProductsInCart = 0
        if cartData.count > 0{
            for index in 0...cartData.count - 1 {
                if cartData[index].productStatus == "Available"{
                    total += cartData[index].productPrice! * cartData[index].productQuantity!
                    totalProductsInCart += 1
                }else{
                    total += 0
                }
            }
        }else {
            total = 0
        }
        
        totalPayableAmount = "\(total)"
        lbTotal.text = "Total Cart Amount: $\(total)"
    }
    
    
}
