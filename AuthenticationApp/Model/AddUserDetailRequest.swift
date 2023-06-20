//
//  AddUserDetailRequest.swift
//  AuthenticationApp
//
//  Created by poskreepta on 13.06.23.
//

import Foundation

struct AddUserDetailsRequest: Codable {
    let first_name: String
    let last_name: String
    let birth_date: String
    let email: String
    let user_id: String
    //    let phone_number: String
}
