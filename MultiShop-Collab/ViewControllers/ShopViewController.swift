//
//  ShopViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class ShopViewController: UIViewController  {
    
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
    
    var filteredProductsArr = [Product]()
    
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnFilter: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredProductsArr = productsArr
        
        self.navigationController?.isNavigationBarHidden = true
        shopCollectionView.delegate = self
        shopCollectionView.dataSource = self
        

        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        NotificationCenter.default.post(name: Notification.Name("TimerOpen"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        // Post notification
        NotificationCenter.default.post(name: Notification.Name("TimerClose"), object: nil)
    }
    
    
    @IBAction func onFilterBtnPressed(_ sender: Any) {
        print("pressed filter")
        
        let filtersScreen = self.storyboard?.instantiateViewController(withIdentifier: "FiltersViewController") as! FiltersViewController
        
        self.navigationController?.pushViewController(filtersScreen, animated: true)
        
    }
    
}


extension ShopViewController: UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredProductsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productsCell = shopCollectionView.dequeueReusableCell(withReuseIdentifier: "ShopProductsCollectionViewCell", for: indexPath) as! ShopProductsCollectionViewCell
        
        productsCell.productImg.image = UIImage(named: filteredProductsArr[indexPath.item].image)
        
        productsCell.lblProductTitle.text = filteredProductsArr[indexPath.item].title
        
        return productsCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: shopCollectionView.frame.width/3 - 6, height: 100 - 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 16
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
      return 6
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredProductsArr = searchText.trimmingCharacters(in: .whitespaces).isEmpty ? productsArr : productsArr.filter{(product: Product) -> Bool in
            return product.title.range(of: searchText.trimmingCharacters(in: .whitespaces), options: .caseInsensitive) != nil
            }
        shopCollectionView.reloadData()
    }
    
    
}
