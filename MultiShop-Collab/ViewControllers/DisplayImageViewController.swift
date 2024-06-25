//
//  DisplayImageViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class DisplayImageViewController: UIViewController {

    var productImages = [String]()

    @IBOutlet weak var displayCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        displayCollectionView.delegate = self
        displayCollectionView.dataSource = self
        
    }
    
    override func viewWillLayoutSubviews() {
      super.viewWillLayoutSubviews()

        displayCollectionView.reloadData()
    }

    
    @IBAction func onCloseBtnPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}


extension DisplayImageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dispalyImageCell = displayCollectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell1", for: indexPath) as! SliderCollectionViewCell
        
        dispalyImageCell.sliderImg.image = UIImage(named: productImages[indexPath.row % productImages.count])
        
        return dispalyImageCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: displayCollectionView.frame.width, height: displayCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}
