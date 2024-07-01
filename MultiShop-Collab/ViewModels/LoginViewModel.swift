//
//  loginModel.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 01/07/24.
//

import Foundation


class LoginViewModel: NSObject {
    func callLoginUserApi(request: APIRequest, success successCallBack: @escaping (LoginModel) -> Void, error errorCallBack: @escaping (Error?) -> Void){
        APIClient().perform(request) { (dataUser, error) in
            
            if dataUser != nil {
                do {
                    var json = try JSONSerialization.jsonObject(with: dataUser!)
                    print("print Json: " , json)
                    let decoder = JSONDecoder()
                    
                    let values = try! decoder.decode(LoginModel.self, from: dataUser!)
                    
                    successCallBack(values)
                } catch let error {
                    errorCallBack(error)
                }
                
            }else{
                errorCallBack(error)
                print("parse Error")
            }
        }
    }
}

