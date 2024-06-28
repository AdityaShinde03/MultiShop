//
//  OrderListingViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class OrderListingViewController: UIViewController  {

    
    @IBOutlet weak var viewNoDataFound: UIView!
    
    @IBOutlet weak var ordersHeaderView: UIView!
    @IBOutlet weak var OrdersTableView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var serachBar: UISearchBar!
    
    var ordersDataArr : [Orders] = []
    var checkoutDataTest: CheckoutDetails!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OrdersTableView.delegate = self
        OrdersTableView.dataSource = self

        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        ordersHeaderView.applyBottomBorder(color: UIColor(named: "AppGray")!)
    }

    @IBAction func actionBack(_ sender: Any) {
        moveToPreviousScreen()
    }
}

// MARK: - All Extensions

extension OrderListingViewController {
    func setupUI(){
        btnBack.makeCircle()
        
        OrdersTableView.showsVerticalScrollIndicator = false
        
        if OrderDataUser.checkoutData.count != 0 {
            showUserOrders()
            viewNoDataFound.isHidden = true
        }else{
            ordersDataArr = []
            viewNoDataFound.isHidden = false
        }
    }
}

extension OrderListingViewController {
    func showUserOrders() {
        let userCheckoutData = OrderDataUser.checkoutData!
        
        for checkoutObj in userCheckoutData {
            let checkoutData = checkoutObj
            for idx in 0...(checkoutData.cartData!.count) - 1 {
                let cartObj = checkoutData.cartData![idx]
                let orderObj = Orders(productName: cartObj.productName, orderDate: checkoutData.orderDate, deliveryDate: checkoutData.orderDate, deliveryAddress: checkoutData.deliveryAddress, productQuantity: "\(String(describing: cartObj.productQuantity!))", productImage: cartObj.productImage!)
                ordersDataArr.append(orderObj)
            }
        }
        OrdersTableView.reloadData()
    }
}

extension OrderListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = OrdersTableView.dequeueReusableCell(withIdentifier: "OrderListingTableViewCell", for: indexPath) as! OrderListingTableViewCell
        
        let orderDetails = ordersDataArr[indexPath.row]
        
        cell.DeliveryAddress.text = orderDetails.deliveryAddress
        cell.lbDeliveryDate.text = "Delivery On: " + orderDetails.deliveryDate!
        cell.lbOrderDate.text = "Ordered On: " + orderDetails.orderDate!
        cell.lbOrderStatus.text = orderDetails.orderStatusValue()
        cell.lbProductQuantity.text =  "Quantity: " + orderDetails.productQuantity!
        cell.lbProductName.text = orderDetails.productName
        cell.productImageView.image = UIImage(named: orderDetails.productImage)
        cell.productStatus = orderDetails.orderStatusValue()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}



