//
//  CreateAccountViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class CreateAccountViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var MainView: UIView!
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfConfirmPassword: UITextField!
    
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    @IBOutlet weak var txtViewDefaultAddress: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        
        view.addGestureRecognizer(tap)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    @IBAction func actionCreateAccount(_ sender: Any) {
        if validateEntries(){
            Auth.register(name: tfName.text!, phone: tfPhoneNumber.text!, address: txtViewDefaultAddress.text, email: tfEmail.text!, password: tfPassword.text!)
            moveToPreviousScreen()
        }
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        moveToPreviousScreen()
    }
}

extension CreateAccountViewController {
    func validateEntries() -> Bool{
        if tfName.text == "" || tfEmail.text == "" || tfPassword.text == "" || tfConfirmPassword.text == "" || tfPhoneNumber.text == "" || txtViewDefaultAddress.text == "" {
            alertUser(message: "Every Fields are Required!")
            return false
        }else if tfName.text?.lengthExcludingWhiteSpaces() == 0{
            alertUser(message: "White Spaces not allowed")
            return false
        }else if !tfEmail.text!.isValidEmail(){
            alertUser(message: "Enter Valid Email")
            return false
        }else if tfPassword.text != tfConfirmPassword.text {
            alertUser(message: "Password and Confirm Password must be same")
            return false
        }else if !tfPassword.text!.isValidPassword(){
            alertUser(message: "Password Must have 1 uppercase, 1 lowercase, 1 alphabet, 1 special Charector, min 8 charectors")
            return false
        }else if tfPhoneNumber.text?.count != 10 {
            alertUser(message: "Enter Valid Phone Number")
            return false
        }else{
            return true
        }
    }
    
    func setupUI(){
        tfName.delegate = self
        tfEmail.delegate = self
        tfPassword.delegate = self
        tfConfirmPassword.delegate = self
        
        
        MainView.layer.borderWidth = 1
        MainView.layer.borderColor = UIColor(named: "AppGray")?.cgColor
        MainView.applyCornerRadius(radius: 10)
        
        txtViewDefaultAddress.layer.borderWidth = 1
        txtViewDefaultAddress.layer.borderColor = UIColor(named: "black")?.cgColor
        txtViewDefaultAddress.applyCornerRadius(radius: 3)
    }
}

extension CreateAccountViewController {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.giveBorderToTextField(style: "Focus")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.giveBorderToTextField(style: "Release")
    }
}

extension CreateAccountViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
                let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size.height
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)

        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: { self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) })
    }
    
    @objc func endEditing(){
        view.endEditing(true)
    }
}


