//
//  SignupModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-30.
//

import Foundation

protocol SignupModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isEmailValid(email: String) -> Bool
    func doPasswordsMatch(_ password1: String, _ password2: String) -> Bool
    func isPasswordValid(password: String) -> Bool
}
