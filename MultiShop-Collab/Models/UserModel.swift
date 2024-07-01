//
//  UserModel.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 27/06/24.
//

import Foundation


struct User {
    var Name: String?
    var Email: String?
    var Phone: String?
    var Address: String?
    var Password: String?
    
}

struct UserModel : Codable {
    let success : Bool?
    let message : String?
    let data : UserData?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(UserData.self, forKey: .data)
    }

}

struct UserData : Codable {
    var _id : String? = ""
    var firstName : String? = ""
    var lastName : String? = ""
    var email : String? = ""
    var phone : Int? = 0
    var createdAt : String? = ""
    var updatedAt : String? = ""
    var __v : Int? = 0
    var gender : String? = ""
    var dob : String? = ""
    var profilePic : String? = ""

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case firstName = "firstName"
        case lastName = "lastName"
        case email = "email"
        case phone = "phone"
        case createdAt = "createdAt"
        case updatedAt = "updatedAt"
        case __v = "__v"
        case gender = "gender"
        case dob = "dob"
        case profilePic = "profilePic"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        phone = try values.decodeIfPresent(Int.self, forKey: .phone)
        createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        __v = try values.decodeIfPresent(Int.self, forKey: .__v)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        dob = try values.decodeIfPresent(String.self, forKey: .dob)
        profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
    }

}
