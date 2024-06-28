//
//  ViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit


class HomeViewController: UIViewController, productsCollectionViewDelegate  {

    
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: -  All View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        mainTableView.delegate  = self
        mainTableView.dataSource = self
        
        mainTableView.separatorStyle = .none
        
        Auth.isUserLoggedIn = UserDefaults.standard.bool(forKey: "hasUserLoggedIn")
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()

        mainTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        

        // Post notification
        NotificationCenter.default.post(name: Notification.Name("TimerClose"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.post(name: Notification.Name("TimerOpen"), object: nil)
    }


}

// MARK: - All Extensions

extension HomeViewController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let sliderTblCell = mainTableView.dequeueReusableCell(withIdentifier: "SliderTableViewCell") as! SliderTableViewCell
            
            sliderTblCell.sliderCollectionView.reloadData()
            
            sliderTblCell.selectionStyle = .none
            
            return sliderTblCell
        }else if indexPath.row == 1 {
            let policiesTblCell = mainTableView.dequeueReusableCell(withIdentifier: "PoliciesTableViewCell") as! PoliciesTableViewCell
            
            policiesTblCell.selectionStyle = .none
            
            return policiesTblCell
        }else if indexPath.row == 2 {
            let categoriesTblCell = mainTableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell") as! CategoriesTableViewCell
            
            categoriesTblCell.selectionStyle = .none
            
            return categoriesTblCell
        }
        
        let productsTblCell = mainTableView.dequeueReusableCell(withIdentifier: "FeaturedProductsTableViewCell") as! FeaturedProductsTableViewCell
        
        productsTblCell.delegate = self
        
        productsTblCell.productsCollectionView.reloadData()
        
        productsTblCell.selectionStyle = .none
        
        return productsTblCell
    }
    
    
    func didSelectProduct(at index: Int) {
        let productDetailsScreen = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
        print("productId",index)
        productDetailsScreen.productId = index
        
        self.navigationController?.pushViewController(productDetailsScreen, animated: true)
    }
}
