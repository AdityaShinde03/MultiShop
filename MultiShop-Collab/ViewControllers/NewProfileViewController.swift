//
//  NewProfileViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 26/06/24.
//

import UIKit

class NewProfileViewController: UIViewController {

    
    
    @IBOutlet weak var Headerview: UIView!
    @IBOutlet weak var ProfileTableView: UITableView!
    
    
    // Contact Details
    // Name
    // Email
    // Phone Number
    // Address
    
    // Your Orders
    // Logout
    
    var ProfileData : User!
    var totalTableRow : Int!
    //var userLogggedIn : Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if Auth.isUserLoggedIn {
            totalTableRow = 3
            ProfileData = OrderDataUser.UserDetails
            
            print("get Usrr Dewtails: ", Auth.getUserDetails())
            
            ProfileData = Auth.getUserDetails()
//            ProfileData.Name = UserDefaults.standard.string(forKey: "Name")
//            ProfileData.Email = UserDefaults.standard.string(forKey: "Email")
//            ProfileData.Phone = UserDefaults.standard.string(forKey: "Phone")
//            ProfileData.Address = UserDefaults.standard.string(forKey: "Address")
            
//            Name = UserDefaults.standard.string(forKey: "Name")
//            Email = UserDefaults.standard.string(forKey: "Email")
//            Phone = UserDefaults.standard.string(forKey: "Phone")
//            Address = UserDefaults.standard.string(forKey: "Address")
            
        }else{
            totalTableRow = 1
        }
        
        Headerview.isHidden = false
        ProfileTableView.reloadData()
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        moveToLoginPage()
    }
    
}

extension NewProfileViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalTableRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !Auth.isUserLoggedIn {
            let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "GuestLoginTableViewCell", for: indexPath) as! GuestLoginTableViewCell
            
            Headerview.isHidden = true
            
            return cell
        }else {
            let index = indexPath.row
            
            if index == 0 {
                let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "ContactDetailsTableViewCell", for: indexPath) as! ContactDetailsTableViewCell
                
                cell.lbUserName.text = ProfileData.Name
                cell.lbUserEmail.text = ProfileData.Email
                cell.lbPhoneNumber.text = ProfileData.Phone
                cell.lbAddress.text = ProfileData.Address
                
                return cell
            }else if index == 1 {
                
                let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "YourOrderTableViewCell", for: indexPath) as! YourOrderTableViewCell
                
                cell.delegateToViewOrders = self
                
                return cell
                
            } else {
                let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "LogoutTableViewCell", for: indexPath) as! LogoutTableViewCell
                
                cell.delegateToLogout = self
                return cell
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !Auth.isUserLoggedIn {
            return 502
        }else {
            let index = indexPath.row
            
            if index == 0 {
                return 404
                
            }else if index == 1 {
                return 109
            }else {
                return 75
            }
        }
    }
}


extension NewProfileViewController : ProfileViewDelegate {
    func showOrders() {
        moveToOrderListing()
    }
    
    func logout() {
        Auth.logout()
        ProfileTableView.reloadData()
    }
}
