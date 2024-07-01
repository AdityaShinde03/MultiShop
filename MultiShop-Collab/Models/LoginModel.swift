//
//  LoginModel.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 01/07/24.
//
import Foundation
struct LoginModel : Codable {
    let success : Bool?
    let data : LoginData?
    let message : String?
    let token : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case data = "data"
        case message = "message"
        case token = "token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        data = try values.decodeIfPresent(LoginData.self, forKey: .data)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}

struct LoginData : Codable {
    let firstname : String?
    let lastname : String?
    let email : String?
    let userId : String?

    enum CodingKeys: String, CodingKey {

        case firstname = "firstname"
        case lastname = "lastname"
        case email = "email"
        case userId = "userId"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
        lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
    }

}
