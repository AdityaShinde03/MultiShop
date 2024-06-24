//
//  SelectAddressViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class SelectAddressViewController: UIViewController {

    @IBOutlet weak var AddressTableView: UITableView!
    
    var userAddresses = ["St. Lucia, Kingston, United kingdom", "12 A, Kattegat, Norway", "Hundred Street, Wessex, England"]
    var addressDelegate : SaveAddress!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddressTableView.delegate = self
        AddressTableView.dataSource = self
        AddressTableView.showsVerticalScrollIndicator = false
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func actionAddAddress(_ sender: Any) {
        presentEnterAddressScreen()
    }
    
    @IBAction func actionBack(_ sender: Any) {
        moveToPreviousScreen()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SelectAddressViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userAddresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AddressTableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        
        cell.lbAddress.text = userAddresses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        addressDelegate.saveUserAddress(address: userAddresses[indexPath.row])
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
}

extension SelectAddressViewController: SaveAddress{
    func saveUserAddress(address: String) {
        userAddresses.append(address)
        AddressTableView.reloadData()
    }
}
