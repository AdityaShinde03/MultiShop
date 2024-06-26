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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tfName.delegate = self
        tfEmail.delegate = self
        tfPassword.delegate = self
        tfConfirmPassword.delegate = self
        
        //MainView.borderStyle = .roundedRect
        MainView.layer.borderWidth = 1
        MainView.layer.borderColor = UIColor(named: "AppGray")?.cgColor
        MainView.applyCornerRadius(radius: 10)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        
        view.addGestureRecognizer(tap)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func endEditing(){
        view.endEditing(true)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        giveBorderToTextField(textField: textField, style: "Focus")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        giveBorderToTextField(textField: textField, style: "Release")
    }
    
    func giveBorderToTextField(textField: UITextField, style: String){
        
        
        if style == "Focus" {
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "AppYellow")?.cgColor
        }else{
            textField.layer.borderWidth = 0
            //textField.layer.borderColor = UIColor(named: "AppYellow")?.cgColor
        }
        
    }
    
    @IBAction func actionCreateAccount(_ sender: Any) {
        if validateEntries(){
//            alertUser(message: "Account Created!")
            moveToPreviousScreen()
        }
    }
    
    @IBAction func actionSignIn(_ sender: Any) {
        moveToPreviousScreen()
    }
    
    
    func validateEntries() -> Bool{
        if tfName.text == "" || tfEmail.text == "" || tfPassword.text == "" || tfConfirmPassword.text == "" {
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
        }else{
            return true
        }
    }
    
    func moveToLoginPage(){
        let login = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        navigationController?.pushViewController(login, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
                let keyboardHeight = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size.height
                scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)

        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2, animations: { self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) })
    }

}
