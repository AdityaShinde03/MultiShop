//
//  Extentions.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 24/06/24.
//

import Foundation
import UIKit

extension UIView {
    func applyCornerRadius(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func makeCircle(){
        self.applyCornerRadius(radius: self.frame.width / 2)
    }
}

extension UIViewController {
    func alertUser(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    func moveToPreviousScreen(){
        navigationController?.popViewController(animated: true)
    }
    
    func closePresenting(){
        self.dismiss(animated: true)
    }
}


