//
//  ProductDetailsViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    var productsArr  = OrderDataUser.Products

    var productId : Int!


    @IBOutlet weak var productDetailsTableView: UITableView!
    
// MARK: -  All View Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = productsArr[productId].title
        productDetailsTableView.delegate = self
        productDetailsTableView.dataSource = self
        
        productDetailsTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        NotificationCenter.default.post(name: Notification.Name("TimerOpen1"), object: nil)
        
        productDetailsTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.post(name: Notification.Name("TimerClose1"), object: nil)
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()

        productDetailsTableView.reloadData()
    }
    

}

// MARK: Extensions
extension ProductDetailsViewController:UITableViewDataSource, UITableViewDelegate, ProductDisplayDelegate, ProductChoicesTblCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let productDisplayCell = productDetailsTableView.dequeueReusableCell(withIdentifier: "ProductDisplayTableViewCell", for: indexPath) as! ProductDisplayTableViewCell
            
            productDisplayCell.delegate = self
            productDisplayCell.product = productsArr[productId]
            
            productDisplayCell.selectionStyle = .none
            productDisplayCell.productDisplayCollectionViewCell.reloadData()
            
            return productDisplayCell
        }else if indexPath.row == 1 {
            let productChoicesCell = productDetailsTableView.dequeueReusableCell(withIdentifier: "ProductChoicesTableViewCell", for: indexPath) as! ProductChoicesTableViewCell
            productChoicesCell.delegate = self
            productChoicesCell.lblProductPrice.text = "$\(productsArr[productId].price)"
            productChoicesCell.pId = productId
            productChoicesCell.btnAddToCart.tag = productId
            productChoicesCell.product = productsArr[productId]
            productChoicesCell.selectionStyle = .none
            
            
            
            return productChoicesCell
        }
        
        let suggestedProductsCell = productDetailsTableView.dequeueReusableCell(withIdentifier: "SuggestedProductsTableViewCell", for: indexPath) as! SuggestedProductsTableViewCell
        
        suggestedProductsCell.suggestedProductsCollectionView.reloadData()
        
        suggestedProductsCell.selectionStyle = .none
        
        return suggestedProductsCell
    }
    
    
    func didSelectImage(product: Product) {
        let fullScreenImage = self.storyboard?.instantiateViewController(withIdentifier: "DisplayImageViewController") as! DisplayImageViewController
        
        fullScreenImage.modalTransitionStyle = .crossDissolve
        fullScreenImage.modalPresentationStyle = .fullScreen
        
        fullScreenImage.productImages = [product.image]
        
        present(fullScreenImage, animated: true)
    }
    
    func didAddToCart() {
        alertUser(message: "\(productsArr[productId].title ) Added to cart successfully")
    }
    
}
