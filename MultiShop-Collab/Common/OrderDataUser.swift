//
//  OrderDataUser.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import Foundation

class OrderDataUser{
    static var checkoutData: [CheckoutDetails]! = []
    static var userCartArr: [Cart] = []

    static var UserDetails: User!
    static var Products: [Product] = [
        Product(id: 0, title: "Camera", image: "product-1", price: "123.00", isAddedToCart: false),
        Product(id: 1, title: "T-shirt", image: "product-2", price: "23.00",isAddedToCart: false),
        Product(id: 2, title: "Lamp", image: "product-3", price: "150.00",isAddedToCart: false),
        Product(id: 3, title: "Shoes", image: "product-4", price: "200.00",isAddedToCart: false),
        Product(id: 4, title: "Drone", image: "product-5", price: "130.00",isAddedToCart: false),
        Product(id: 5, title: "Watch", image: "product-6", price: "23.00",isAddedToCart: false),
        Product(id: 6, title: "Dress", image: "product-7", price: "100.00",isAddedToCart: false),
        Product(id: 7, title: "Cosmetics", image: "product-8", price: "99.00",isAddedToCart: false),
        Product(id: 8, title: "Chair", image: "product-9", price: "300.00",isAddedToCart: false),
    ]

}

class Auth {
    static var isUserLoggedIn: Bool! = false
    static var isUserRegisterd: Bool! = false
    static var userId: String = ""
    static var token: String = UserDefaults.standard.string(forKey: "Token")!
    
//    static func register(name: String, phone: String, address: String, email: String, password: String){
//        
//        UserDefaults.standard.setValue(address, forKey: "Address")
//        UserDefaults.standard.setValue(name, forKey: "Name")
//        UserDefaults.standard.setValue(phone, forKey: "Phone")
//        UserDefaults.standard.setValue(email, forKey: "Email")
//        UserDefaults.standard.setValue(password, forKey: "Password")
//        UserDefaults.standard.setValue(isUserRegisterd, forKey: "IsUserRegisterd")
//        isUserRegisterd = true
//    }
    
//    static func login(email: String, password: String){
//        
//        
////        let body = [
////            "email":"up@gmail.com",
////            "password":"Utsavp@123"
////        ]
//        
//        let body = [
//            "email":email,
//            "password":password
//        ]
//        
//        let url = Constants.login
//        
//        let request = APIRequest(isLoader: true, method: .post, path: url, headers: HeaderValue.headerWithoutAuthToken.value, body: body)
//        
//        let loginModel = LoginViewModel()
//        
//        loginModel.callLoginUserApi(request: request) { logModel in
//            print("logModel: ", logModel.token!)
//            let token = logModel.token!
//            UserDefaults.standard.setValue(token, forKey: "Token")
//            isUserLoggedIn = true
//            UserDefaults.standard.setValue(isUserLoggedIn, forKey: "hasUserLoggedIn")
//        } error: { error in
//            print("error: ", error as Any)
//        }
//    }
    
    static func logout(){
        isUserLoggedIn = false
        UserDefaults.standard.setValue(isUserLoggedIn, forKey: "hasUserLoggedIn")
    }
    
    static func getUserDetails() -> User {
        
        let name = UserDefaults.standard.string(forKey: "Name")
        let phone = UserDefaults.standard.string(forKey: "Phone")
        let email = UserDefaults.standard.string(forKey: "Email")
        let address = UserDefaults.standard.string(forKey: "Address")
        let password = UserDefaults.standard.string(forKey: "Password")
        
        return User(Name: name, Email: email, Phone: phone, Address: address, Password: password)
    }
}

class UserProfile {
    
    // get user data
    // edit user data
    // delete user data
    //
    
    var UserDataArr:  UserData!
    
//    func registerUser(){
//        
//        let body = [
//            "email":"up@gmail.com",
//            "password":"Utsavp@123",
//            "firstName":"Uv",
//            "lastName":"Pandya",
//            "phone":"7574028089"
//        ]
//        
//        let url = Constants.register
//        
//        let request = APIRequest(isLoader: true, method: .post, path: url, headers: HeaderValue.headerWithoutAuthToken.value, body: body)
//        
//        let regModel = RegisterViewModel()
//        
//        regModel.callRegisterUserApi(request: request) { regDataModel in
//            print("regdata: ", regDataModel)
//        } error: { error in
//            print("registration error: ", error)
//        }
//   
//    }
    
//    func loginUser(){
//        
//        let body = [
//            "email":"up@gmail.com",
//            "password":"Utsavp@123"
//        ]
//        
//        let url = Constants.login
//        
//        let request = APIRequest(isLoader: true, method: .post, path: url, headers: HeaderValue.headerWithoutAuthToken.value, body: body)
//        
//        let loginModel = LoginViewModel()
//        
//        loginModel.callLoginUserApi(request: request) { logModel in
//            print("logModel: ", logModel.token!)
//            let token = logModel.token!
//            UserDefaults.standard.setValue(token, forKey: "Token")
//        } error: { error in
//            print("error: ", error as Any)
//        }
//
//        
//    }
    
    
    

    
    

    
}



