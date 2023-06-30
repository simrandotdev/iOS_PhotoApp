//
//  SignupFormModel.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-30.
//

import Foundation

struct SignupFormModel: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    let repeatPassword: String
}
