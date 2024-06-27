//
//  CheckoutViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var CheckTableView: UITableView!
    
    @IBOutlet weak var checkoutHeaderView: UIView!
    var totalProduct: String!
    var totalAmount: String!
    
    var userSelectedAddress = "Ganesh Meridian, Thaltej"
    var checkoutDetails : CheckoutDetails!
    
    var cartData = [] as [Cart]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CheckTableView.delegate = self
        CheckTableView.dataSource = self
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        checkoutHeaderView.applyBottomBorder(color: UIColor(named: "AppGray")!)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        moveToPreviousScreen()
    }
    
    @IBAction func actionAddAddress(_ sender: Any) {
        moveToSelectAddress()
    }
    
    
    @IBAction func actionPlaceOrder(_ sender: Any) {
        
        if Auth.isUserLoggedIn {
            let mainCartData = filterCartData()
            
            let checkoutObj = CheckoutDetails(cartData: mainCartData, deliveryAddress: userSelectedAddress, orderDate: "23-06-2024")
            
            print("mainCartdata", mainCartData.count)
            
            
            
            OrderDataUser.checkoutData.append(checkoutObj) 
            
            OrderDataUser.userCartArr = []
            
            alertUser(message: "Your Order Placed Successfully!!")
        }else {
            alertUserToLogin()
        }
    }
    
    
}

extension CheckoutViewController {
    func setupUI(){
        btnBack.makeCircle()
        CheckTableView.showsVerticalScrollIndicator = false
    }
    
    func filterCartData() -> [Cart] {
        let mainCartData = cartData.filter { cart in
            return cart.productStatus == "Available"
        }
        
        return mainCartData
    }
    
    func moveToSelectAddress(){
        let selectAddress = self.storyboard?.instantiateViewController(withIdentifier: "SelectAddressViewController") as! SelectAddressViewController
        selectAddress.addressDelegate = self
        self.navigationController?.pushViewController(selectAddress, animated: true)
    }
}

extension CheckoutViewController: SaveAddress {
    func saveUserAddress(address: String, type: String) {
        userSelectedAddress = address
        CheckTableView.reloadData()
    }
}

extension CheckoutViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = CheckTableView.dequeueReusableCell(withIdentifier: "DeliveryAddressTableViewCell", for: indexPath) as! DeliveryAddressTableViewCell
            cell.lbSelectedAddress.text = userSelectedAddress
            return cell
        }else{
            let cell = CheckTableView.dequeueReusableCell(withIdentifier: "PlaceOrderTableViewCell", for: indexPath) as! PlaceOrderTableViewCell
            cell.lbPaymentAmount.text = "$" + totalAmount
            cell.lbTotalProducts.text = totalProduct
            return cell
        }
    }
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 104
        }else{
            return 233
        }
    }
}

extension CheckoutViewController {
    func alertUserToLogin(){
        let alertUserController = UIAlertController(title: "Login Required", message: "Kindly Login", preferredStyle: .alert)
        alertUserController.addAction(UIAlertAction(title: "Ok", style: .default))
        alertUserController.addAction(UIAlertAction(title: "Login", style: .cancel, handler: { alert in
            self.moveToLoginPage()
        }))
        present(alertUserController, animated: true)
    }
    
//    func moveToLoginScreen(){
//        let login = UIStoryboard(name: "Profile", bundle: nibBundle).instantiateViewController(identifier: "SignInViewController") as! SignInViewController
//        self.navigationController?.pushViewController(login, animated: true)
//    }
}


