//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-06-30.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var doPasswordsMatch: Bool = false
    var isPasswordValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return true
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return true
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return true
    }
    
    func doPasswordsMatch(_ password1: String, _ password2: String) -> Bool {
        doPasswordsMatch = true
        return true
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return true
    }
}
