//
//  SliderTableViewCell.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import UIKit

class SliderTableViewCell: UITableViewCell {

    var carouselImages = ["carousel-1","carousel-2","carousel-3"]
    var currentPage = 0
    
    var timer = Timer()

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pageControl.numberOfPages = carouselImages.count
        pageControl.currentPage = 0
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(automaticScrollImage), userInfo: nil, repeats: true)
        
        sliderCollectionView.delegate  = self
        sliderCollectionView.dataSource = self
        
        sliderCollectionView.layer.cornerRadius = 9.0
        sliderCollectionView.clipsToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(onCloseTimer), name: Notification.Name("TimerClose"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onOpenTimer), name: Notification.Name("TimerOpen"), object: nil)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func automaticScrollImage() {
        
        if currentPage < carouselImages.count * 3000 {
                  let index = IndexPath.init(item: currentPage, section: 0)
                  self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            print(currentPage)
            pageControl.currentPage = currentPage % carouselImages.count
                  currentPage += 1
             }
//        else {
//                  currentPage = 0
//                  let index = IndexPath.init(item: currentPage, section: 0)
//                  self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
//                   pageControl.currentPage = currentPage
//                   currentPage = 1
//               }
        
    }
    
    @objc func onCloseTimer(){
        timer.invalidate()
    }
    
    @objc func onOpenTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(automaticScrollImage), userInfo: nil, repeats: true)
    }

}

extension SliderTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselImages.count * 3000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sliderCollcetionCell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
        
        sliderCollcetionCell.sliderImg.image = UIImage(named: carouselImages[indexPath.row % carouselImages.count])
        
        sliderCollcetionCell.sliderImg.layer.cornerRadius = 9.0
        
        return sliderCollcetionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
        pageControl.currentPage = currentPage % carouselImages.count
    }
    
}
