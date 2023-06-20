//
//  CreatePasswordRequest.swift
//  AuthenticationApp
//
//  Created by poskreepta on 15.06.23.
//

import Foundation

struct SavePasswordRequest: Codable {
    let password1: String
    let password2: String
    let user_id: String
}
