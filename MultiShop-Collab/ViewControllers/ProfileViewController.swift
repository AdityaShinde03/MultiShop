//
//  ProfileViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageProfile.makeCircle()
    }
    

    @IBAction func actionYourOrders(_ sender: Any) {
        moveToOrderListing()
    }
    
//    func moveToOrderListing(){
//        print("move to order listing")
//        let orders = UIStoryboard(name: "OrderListing", bundle: nibBundle).instantiateViewController(withIdentifier: "OrderListingViewController") as! OrderListingViewController
//        self.navigationController?.pushViewController(orders, animated: true)
//    }

}
