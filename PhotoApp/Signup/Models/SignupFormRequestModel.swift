//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-22.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
