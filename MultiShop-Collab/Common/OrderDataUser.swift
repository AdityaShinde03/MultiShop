//
//  OrderDataUser.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 25/06/24.
//

import Foundation

class OrderDataUser{
    static var checkoutData: CheckoutDetails!
    static var userCartArr: [Cart] = []
    //static var UserDetails: User!
}

class Auth {
    static var isUserLoggedIn: Bool! = false
    static var isUserRegisterd: Bool! = false
    
    static func register(name: String, phone: String, address: String, email: String, password: String){
        
        UserDefaults.standard.setValue(address, forKey: "Address")
        UserDefaults.standard.setValue(name, forKey: "Name")
        UserDefaults.standard.setValue(phone, forKey: "Phone")
        UserDefaults.standard.setValue(email, forKey: "Email")
        UserDefaults.standard.setValue(password, forKey: "Password")
        UserDefaults.standard.setValue(isUserRegisterd, forKey: "IsUserRegisterd")
        isUserRegisterd = true
    }
    
    static func login(){
        isUserLoggedIn = true
        UserDefaults.standard.setValue(isUserLoggedIn, forKey: "hasUserLoggedIn")
    }
    
    static func logout(){
        isUserLoggedIn = false
        UserDefaults.standard.setValue(isUserLoggedIn, forKey: "hasUserLoggedIn")
    }
    
    static func getUserDetails() -> User {
        
        let name = UserDefaults.standard.string(forKey: "Name")
        let phone = UserDefaults.standard.string(forKey: "Phone")
        let email = UserDefaults.standard.string(forKey: "Email")
        let address = UserDefaults.standard.string(forKey: "Address")
        
        return User(Name: name, Email: email, Phone: phone, Address: address)
    }
}




