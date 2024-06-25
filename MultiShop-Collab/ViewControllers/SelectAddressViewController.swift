//
//  SelectAddressViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class SelectAddressViewController: UIViewController {

    @IBOutlet weak var AddressTableView: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    
    
    
    var userAddresses = ["St. Lucia, Kingston, United kingdom", "12 A, Kattegat, Norway", "Hundred Street, Wessex, England"]
    var userAddressType = ["Home", "Office", "Other"]
    //var addressIcons = []
    var addressDelegate : SaveAddress!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddressTableView.delegate = self
        AddressTableView.dataSource = self
        
        
        setupUI()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionAddAddress(_ sender: Any) {
        presentEnterAddressScreen()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        moveToPreviousScreen()
    }

}

extension SelectAddressViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userAddresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AddressTableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        cell.typeOfAddress = userAddressType[indexPath.row]
        cell.lbAddressType.text = userAddressType[indexPath.row]
        cell.lbAddress.text = userAddresses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addressDelegate.saveUserAddress(address: userAddresses[indexPath.row], type: userAddressType[indexPath.row])
        moveToPreviousScreen()
    }
}


extension SelectAddressViewController{
    func presentEnterAddressScreen(){
        let enterAddress = self.storyboard?.instantiateViewController(withIdentifier: "TypeAddressViewController") as! TypeAddressViewController
        enterAddress.delegate = self
        enterAddress.modalTransitionStyle = .crossDissolve
        enterAddress.modalPresentationStyle = .fullScreen
        enterAddress.view.backgroundColor = UIColor(white: 0.9, alpha: 0.3)
        present(enterAddress, animated: true)
    }
    
    func setupUI(){
        btnBack.makeCircle()
        AddressTableView.showsVerticalScrollIndicator = false
    }
}

extension SelectAddressViewController: SaveAddress{
    func saveUserAddress(address: String, type: String) {
        userAddresses.append(address)
        userAddressType.append(type)
        AddressTableView.reloadData()
    }
}
