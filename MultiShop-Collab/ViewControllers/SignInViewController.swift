//
//  SignInViewController.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var SignInView: UIView!
    
    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SignInView.layer.borderWidth = 1
        SignInView.layer.borderColor = UIColor(named: "AppGray")?.cgColor
        SignInView.applyCornerRadius(radius: 10)
        
        
        tfEmail.delegate = self
        tfPassword.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
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
    
    @IBAction func actionLogin(_ sender: Any) {
        if validateEntries() {
            Auth.login()
            moveToPreviousScreen()
            //alertUser(message: "User Logged In")
            //moveToMainScreen()
        }
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        //Auth.isUserLoggedIn = true
        moveToCreateAccountPage()
    }
    
    func validateEntries() -> Bool{
        if tfEmail.text == "" || tfPassword.text == "" {
            alertUser(message: "Every Fields are required")
            return false
        }else if (tfEmail.text?.lengthExcludingWhiteSpaces())! <= 0 || (tfPassword.text?.lengthExcludingWhiteSpaces())! <= 0 {
            alertUser(message: "Please enter valid entries")
            return false
        }else{
            if tfEmail.text == Auth.getUserDetails().Email! {

                if tfPassword.text == Auth.getUserDetails().Password! {
                    return true
                }
                
                alertUser(message: "Please enter correct password!!!")
                return false
                
            }else{
                alertUser(message: "Please Register yourself!!!")
                return false
            }
            
        }
    }
    
    func moveToCreateAccountPage(){
        let createAcc = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        navigationController?.pushViewController(createAcc, animated: true)
    }
    
    func moveToMainScreen(){
        let mainScreen = UIStoryboard(name: "Main", bundle: nibBundle).instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        navigationController?.pushViewController(mainScreen, animated: true)
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
    
    @IBAction func actionContinueAsGuest(_ sender: Any) {
        UserDefaults.standard.setValue(true, forKey: "userAsGuest")
        Auth.isUserLoggedIn = false
        moveToPreviousScreen()
    }

}
