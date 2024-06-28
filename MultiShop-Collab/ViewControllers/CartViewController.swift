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
    
    @IBOutlet weak var mycartHeaderView: UIView!
    // MARK: - Cart Data
    var productData = ["Shoes": 45, "T-shirt": 45, "Lamp": 30, "Drones": 100, "Speaker": 80] as [String: Any]
    
    var productImages = ["product-1","product-2","product-3","product-4","product-5","product-6","product-7","product-8","product-9"]
    var productStatus = ["Available","Not Available","Available","Available","Available","Available","Not Available","Available","Available"]
    var productName = ["Speaker","T-Shirt","Lamp","Shoes","Drone","Watch","Black-Shirt","Foundation","Chair"]
    var productPrice = [45,45,30,100,80, 45,45,30,100]
    var productQuantity = [1,1,1,1,1,1,1,1,1]
    
//    var cartData = [] as [Cart]
    var totalPayableAmount: String!
    var isBtnDisabled = false
    
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
    
    override func viewDidLayoutSubviews() {
        mycartHeaderView.applyBottomBorder(color: UIColor(named: "AppGray")!)
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
//        cartData = OrderDataUser.userCartArr
        showQuantityTotal()
        CartTableView.reloadData()
    
    }
    
    func moveToCheckOut(){
        let checkout = self.storyboard?.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
        checkout.totalAmount = totalPayableAmount
        checkout.totalProduct = "\(totalProductsInCart!)"
        checkout.cartData = OrderDataUser.userCartArr
        self.navigationController?.pushViewController(checkout, animated: true)
    }
}

// MARK: - Table View Delegates Extensions
extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return OrderDataUser.userCartArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
        
        let index = indexPath.row
        let cartProduct = OrderDataUser.userCartArr[index]
        cell.delegate = self
        
        cell.btnPlus.tag = indexPath.row + 1
        cell.btnMinus.tag = indexPath.row + 1
        
        cell.imageProduct.image = UIImage(named: cartProduct.productImage!)
    
        cell.lbName.text = cartProduct.productName
        cell.lbPrice.text = "$\(cartProduct.productPrice ?? 0)"
        cell.lbStatus.applyCornerRadius(radius: 6.0)
        
        if cartProduct.productStatus == "Available" {
            cell.lbStatus.textColor = UIColor(named: "StatusAvailable")
        }else {
            cell.lbStatus.textColor = UIColor(named: "StatusNotAvailable")
        }
        
        cell.lbStatus.text = cartProduct.productStatus
        cell.lbQty.text = "\(cartProduct.productQuantity!)"
        //cell.isAvailable = productStatus[index]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToProductsDetailsScreen(of: OrderDataUser.userCartArr[indexPath.row].productId!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 159
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let removeData = UIContextualAction(style: .destructive, title: "Remove from Cart") { (action,view,completionHandler ) in
            let pId = OrderDataUser.userCartArr[indexPath.row].productId
            OrderDataUser.userCartArr.remove(at: indexPath.row)
            OrderDataUser.Products[pId!].isAddedToCart = false
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



        OrderDataUser.userCartArr[index].productQuantity! += 1
        if isBtnDisabled && OrderDataUser.userCartArr[index].productQuantity! > 1{
            print("Working")
            NotificationCenter.default.post(name: NSNotification.Name("enableMinusBtn"), object: nil)
            isBtnDisabled = false
        }
        showQuantityTotal()
        CartTableView.reloadData()
    }
    
    func substractQuantity(index: Int) {
        OrderDataUser.userCartArr[index].productQuantity! -= 1
        if OrderDataUser.userCartArr[index].productQuantity! == 1 {
            isBtnDisabled  =  true
            NotificationCenter.default.post(name: NSNotification.Name("disableMinusBtn"), object: nil)
        }
        showQuantityTotal()
        CartTableView.reloadData()
    }
    
    func showQuantityTotal(){
        var total = 0
        totalProductsInCart = 0
        if OrderDataUser.userCartArr.count > 0{
            for index in 0...OrderDataUser.userCartArr.count - 1 {
                if OrderDataUser.userCartArr[index].productStatus == "Available"{
                    total += OrderDataUser.userCartArr[index].productPrice! * OrderDataUser.userCartArr[index].productQuantity!
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
