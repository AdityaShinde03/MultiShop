//
//  ProductDetailsViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class ProductDetailsViewController: UIViewController{
    
    var productsArr  = [
        Product(title: "Camera", image: "product-1", price: "$ 123.00"),
        Product(title: "T-shirt", image: "product-2", price: "$ 123.00"),
        Product(title: "Lamp", image: "product-3", price: "$ 123.00"),
        Product(title: "Shoes", image: "product-4", price: "$ 123.00"),
        Product(title: "Drone", image: "product-5", price: "$ 123.00"),
        Product(title: "Watch", image: "product-6", price: "$ 123.00"),
        Product(title: "Dress", image: "product-7", price: "$ 123.00"),
        Product(title: "Cosmetics", image: "product-8", price: "$ 123.00"),
        Product(title: "Chair", image: "product-9", price: "$ 123.00"),
    ]

    var productId : IndexPath!


    @IBOutlet weak var productDetailsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        productDetailsTableView.delegate = self
        productDetailsTableView.dataSource = self
        
        productDetailsTableView.separatorStyle = .none
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()

        productDetailsTableView.reloadData()
    }
    

}

extension ProductDetailsViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let productDisplayCell = productDetailsTableView.dequeueReusableCell(withIdentifier: "ProductDisplayTableViewCell", for: indexPath) as! ProductDisplayTableViewCell
            
            productDisplayCell.product = productsArr[productId.row]
            
            productDisplayCell.productDisplayCollectionViewCell.reloadData()
            
            return productDisplayCell
        }
        
        let productDisplayCell = productDetailsTableView.dequeueReusableCell(withIdentifier: "ProductDisplayTableViewCell", for: indexPath) as! ProductDisplayTableViewCell
        
        return productDisplayCell
    }
    
}
