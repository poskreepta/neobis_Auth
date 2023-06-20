//
//  SucessResponse.swift
//  AuthenticationApp
//
//  Created by poskreepta on 08.06.23.
//

import Foundation

struct CreateUser: Decodable {
    let email: String
    let user_id: Int
}

struct CreateProfile: Decodable {
    let first_name: String
    let last_name: String
    let birth_date: String
    let email: String
//    let phone_number: String
}

struct CreatePassword: Decodable {
    let message: String
}

struct Login: Decodable {
    let token: Token
    let email: String
    let user_id: Int
}

struct Token: Decodable {
    let access: String
    let refresh: String
}

struct ForgotPassword: Decodable {
    let msg: String
    let user_id: Int
}

struct ErrorResponse: Decodable {
    let error: String
}

struct TokenAccess: Decodable {
    
}




