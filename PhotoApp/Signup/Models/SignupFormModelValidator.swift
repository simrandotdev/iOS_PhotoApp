//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-19.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < SignupConstants.firstNameMinLength
            || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        var returnValue = true
        
        if lastName.count < SignupConstants.lastNameMinLength
            || lastName.count > SignupConstants.lastNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    
    func isEmailValid(email: String) -> Bool {

        if email.count < SignupConstants.lastNameMinLength
            || email.count > SignupConstants.lastNameMaxLength {
            return false
        }
        
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func doPasswordsMatch(_ password1: String, _ password2: String) -> Bool {
        
        return password1 == password2
    }
    
    func isPasswordValid(password: String) -> Bool {
        
        if password.count < SignupConstants.passwordMinLength
            || password.count > SignupConstants.passwordMaxLength {
            return false
        }
        
        return true
    }
}
