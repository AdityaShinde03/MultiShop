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
    

  
    @IBOutlet weak var lblUserName: UILabel!
    
    //var UserDataArr: UserData!
    var ProfileData : UserData?
    var totalTableRow : Int! = 1
    var userProfile: UserProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileTableView.delegate = self
        ProfileTableView.dataSource = self

        
        ProfileTableView.separatorStyle = .none

        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("===========================================================================================================")
        print("Token on View Will Appear", UserDefaults.standard.string(forKey: "Token") as Any)
        print("===========================================================================================================")
        setupUI()
        
    }
    
    
    @IBAction func actionLogin(_ sender: Any) {
        moveToLoginPage()
       
    }
    
    @IBAction func actionEditProfile(_ sender: Any) {
        let edit = self.storyboard?.instantiateViewController(withIdentifier: "EditViewController") as! EditViewController
        
        navigationController?.pushViewController(edit, animated: true)
    }
    
}

extension NewProfileViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Auth.isUserLoggedIn {
            
            totalTableRow = 3
        }else{
            totalTableRow = 1
        }
        return totalTableRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !Auth.isUserLoggedIn {
            let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "GuestLoginTableViewCell", for: indexPath) as! GuestLoginTableViewCell
            cell.selectionStyle = .none
            Headerview.isHidden = true
            ProfileTableView.tableHeaderView?.frame.size = CGSize(width: ProfileTableView.frame.width, height: 50.0)
          
            return cell
        }else {
            let index = indexPath.row
            
            if index == 0 {
                let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "ContactDetailsTableViewCell", for: indexPath) as! ContactDetailsTableViewCell
                
                cell.selectionStyle = .none
                
                cell.lbUserName.text = ProfileData?.firstName
                cell.lbUserEmail.text = ProfileData?.email
                cell.lbPhoneNumber.text = "\(ProfileData?.phone ?? 9999999999)"
                cell.lbAddress.text = "empty Address"
                return cell
                
            }else if index == 1 {
                let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "YourOrderTableViewCell", for: indexPath) as! YourOrderTableViewCell         
                cell.selectionStyle = .none
                cell.delegateToViewOrders = self
                return cell
            } else {
                let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "LogoutTableViewCell", for: indexPath) as! LogoutTableViewCell            
                cell.selectionStyle = .none
                cell.delegateToLogout = self
                return cell
            }
//            
//            let cell = UITableViewCell()
//            return cell
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
        UserDefaults.standard.removeObject(forKey: "Token")
        UserDefaults.standard.removeObject(forKey: "UserId")
        ProfileTableView.reloadData()
    }
}

extension NewProfileViewController {
    
    
    
    func setupUI(){
        if Auth.isUserLoggedIn {
            print("user has logged In")
            totalTableRow = 3
            //ProfileData = Auth.getUserDetails()
            fetchUserData()
            
        }else{
            totalTableRow = 1
        }
        

    }
}


extension NewProfileViewController {
    func fetchUserData() {
        let url = Constants.getUserDetails
        print("url: ", url)
        
        let request = APIRequest(isLoader: true, method: .get, path: url, headers: HeaderValue.headerWithToken.value, body: nil)
        
        let userModel = UserViewModel()
        print("Header: ", HeaderValue.headerWithToken.value)
        userModel.callUserDataApi(request: request) { [self] userModelData in
            
            DispatchQueue.main.async { [self] in
                ProfileData = userModelData.data
                print("====================================>>>>>>>>>>>>>>>Print profiledata: ", ProfileData)
                Headerview.isHidden = false
                ProfileTableView.tableHeaderView?.frame.size = CGSize(width: ProfileTableView.frame.width, height: 219.0)
                //ProfileTableView.reloadData()
                ProfileTableView.reloadData()
                
                
            }
        
        } error: { error in
            print("error at UserProfile")
        }
 
    }
}
