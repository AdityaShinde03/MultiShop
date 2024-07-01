//
//  RegisterUserModel.swift
//  MultiShop-Collab
//
//  Created by webcodegenie on 01/07/24.
//

import Foundation
struct RegisterUserModel : Codable {
    let success : Bool?
    let message : String?
    let tokendata : TokenData?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case message = "message"
        case tokendata = "tokendata"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        tokendata = try values.decodeIfPresent(TokenData.self, forKey: .tokendata)
    }

}

struct TokenData : Codable {
    let token : String?

    enum CodingKeys: String, CodingKey {

        case token = "token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        token = try values.decodeIfPresent(String.self, forKey: .token)
    }

}
