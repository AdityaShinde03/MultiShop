//
//  ViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit


class HomeViewController: UIViewController  {

    
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        mainTableView.delegate  = self
        mainTableView.dataSource = self
        
        mainTableView.separatorStyle = .none
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()

        mainTableView.reloadData()
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
        
        productsTblCell.productsCollectionView.reloadData()
        
        productsTblCell.selectionStyle = .none
        
        return productsTblCell
    }
}
