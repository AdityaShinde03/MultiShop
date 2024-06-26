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

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
    
    
    func lengthExcludingWhiteSpaces() -> Int{
        let length = self.trimmingCharacters(in: CharacterSet.whitespaces).count
        
        return length
    }
    
    func convertToInt() -> Int{
        return Int(Double(self)!)
    }
}

