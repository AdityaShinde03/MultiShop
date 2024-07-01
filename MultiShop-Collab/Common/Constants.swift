//
//  Constants.swift
//  GoRestCoreData
//
//  Created by webcodegenie on 05/06/24.
//
import UIKit

let headerContentType =  "Content-Type"
let contentTypeUrlJSON =  "application/json"
//let bearerToken = "Bearer " + "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2ODI0NmJlMzM1NzM2NmU4MjcxY2UxZiIsImlhdCI6MTcxOTgxNDUwMSwiZXhwIjoxNzE5ODE4MTAxfQ.qhqHrPvxMr2e9iPSiTo8KTxeuLvglZ--w"
var bearerToken = "Bearer " + UserDefaults.standard.string(forKey: "Token")!//Auth.token




class Constants {
    
    static let BASE_URL = "https://mycart-api.demoserver.biz"
    static let getAllProducts = "\(BASE_URL)/product"
    static let getSingleProduct = "\(BASE_URL)/product"
    static let getRealtedProducts = "\(BASE_URL)/product/related/667a45a4d1c6aa2884c475a9"
    
    static let register = "\(BASE_URL)/user/register"
    static let login = "\(BASE_URL)/user/login"
    static let getUserDetails = "\(BASE_URL)/user"
    static let updateUserDetails = "\(BASE_URL)/user"
    
    static let enquiry = "\(BASE_URL)/enquiry"
    
    static let getAllCategories = "\(BASE_URL)/category/get-all-categories"
    
    static let getUserCart = "\(BASE_URL)/cart/"
    static let manage = "\(BASE_URL)/cart/manage-cart"
    static let deleteProductFromCart = "\(BASE_URL)/cart/"
    static let getUserOrders = "\(BASE_URL)/user/orders/"
    var bearerToken = "Bearer " + Auth.token
    
}

