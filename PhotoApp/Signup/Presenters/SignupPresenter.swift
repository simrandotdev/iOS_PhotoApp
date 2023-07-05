//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-30.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var signupWebService: SignupWebServiceProtocol
    private weak var signupViewDelegate: SignupViewDelegateProtocol?

    
    init(formModelValidator: SignupModelValidatorProtocol,
         signupViewDelegate: SignupViewDelegateProtocol? = nil,
         signupWebService: SignupWebServiceProtocol = SignupWebService(urlString: "https://appsdeveloperblog.com:8080/signup-mock-service/users")) {
        self.formModelValidator = formModelValidator
        self.signupWebService = signupWebService
        self.signupViewDelegate = signupViewDelegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(formModel.password, formModel.repeatPassword) {
            return
        }
        
        let requestModel: SignupFormRequestModel = .init(firstName: formModel.firstName,
                                                         lastName: formModel.lastName,
                                                         email: formModel.email,
                                                         password: formModel.password)
        signupWebService.signup(withForm: requestModel) { response, error in
            
            if let response = response {
                self.signupViewDelegate?.successfulSignup()
                return
            }
        }
    }
}
