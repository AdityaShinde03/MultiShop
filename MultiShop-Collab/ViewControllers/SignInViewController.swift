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
    
    var userProfile: UserProfile!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        notifyKeyboardActivity()
        addTapGesture()
    }

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        login(email: tfEmail.text!, password: tfPassword.text!)
    }
    
    @IBAction func actionSignUp(_ sender: UIButton) {
        moveToCreateAccountPage()
    }
    
    func moveToCreateAccountPage(){
        let createAcc = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController") as! CreateAccountViewController
        navigationController?.pushViewController(createAcc, animated: true)
    }
    
    func moveToMainScreen(){
        let mainScreen = UIStoryboard(name: "Main", bundle: nibBundle).instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        navigationController?.pushViewController(mainScreen, animated: true)
    }
    

    
    @IBAction func actionContinueAsGuest(_ sender: Any) {
        UserDefaults.standard.setValue(true, forKey: "userAsGuest")
        Auth.isUserLoggedIn = false
        moveToPreviousScreen()
    }

}

extension SignInViewController {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        giveBorderToTextField(textField: textField, style: "Focus")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        giveBorderToTextField(textField: textField, style: "Release")
    }
}

extension SignInViewController {
    func login(email: String, password: String){
        
        
//        let body = [
//            "email":"up@gmail.com",
//            "password":"Utsavp@123"
//        ]
        
        let body = [
            "email":email,
            "password":password
        ]
        
        print("passed body: ", body)
        
        let url = Constants.login
        
        let request = APIRequest(isLoader: true, method: .post, path: url, headers: HeaderValue.headerWithoutAuthToken.value, body: body)
        
        let loginModel = LoginViewModel()
        
        loginModel.callLoginUserApi(request: request) { logModel in
            DispatchQueue.main.async{
                print("logModel: ", logModel)
                
                if logModel.success!{
                    let token = logModel.token!
                    print("******+++================server token: ", token)
                    UserDefaults.standard.setValue(token, forKey: "Token")
                    UserDefaults.standard.synchronize()
                    print("******+++================local Token: ", UserDefaults.standard.string(forKey: "Token")!)
                    bearerToken = "Bearer " + UserDefaults.standard.string(forKey: "Token")!
                    Auth.isUserLoggedIn = true
                    Auth.token = UserDefaults.standard.string(forKey: "Token")!
                    print("user ID: ",logModel.data?.userId as Any)
                    Auth.userId = (logModel.data?.userId)!
                    UserDefaults.standard.setValue(logModel.data?.userId, forKey: "UserId")
                    UserDefaults.standard.setValue(Auth.isUserLoggedIn, forKey: "hasUserLoggedIn")
                    
                    
                    
                    self.moveToPreviousScreen()
                }else{
                    self.alertUser(message: logModel.message!)
                }
            }
        } error: { error in
            print("error: ", error as Any)
        }
    }
}

extension SignInViewController {
    
    func notifyKeyboardActivity(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    func addTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        view.addGestureRecognizer(tap)
    }
    
    func setupUI(){
        
        tfEmail.delegate = self
        tfPassword.delegate = self
        
        SignInView.layer.borderWidth = 1
        SignInView.layer.borderColor = UIColor(named: "AppGray")?.cgColor
        SignInView.applyCornerRadius(radius: 10)
    }
    
    func validateEntries() -> Bool{
        if tfEmail.text == "" || tfPassword.text == "" {
            alertUser(message: "Every Fields are required")
            return false
        }else if (tfEmail.text?.lengthExcludingWhiteSpaces())! <= 0 || (tfPassword.text?.lengthExcludingWhiteSpaces())! <= 0 {
            alertUser(message: "Please enter valid entries")
            return false
        }else{
            
            if let email = Auth.getUserDetails().Email{
                if tfEmail.text == email {
                    
                    if tfPassword.text == Auth.getUserDetails().Password! {
                        return true
                    }
                    
                    alertUser(message: "Please enter correct password!!!")
                    return false
                    
                }else{
                    alertUser(message: "Please Register yourself!!!")
                    return false
                }
            }else{
                alertUser(message: "Please Register yourself!!!")
                return false
            }
            
        }
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
}

extension SignInViewController {
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
