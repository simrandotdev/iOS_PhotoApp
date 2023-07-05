//
//  MockSignUpWebService.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-07-03.
//

import Foundation
@testable import PhotoApp

class MockSignUpWebService: SignupWebServiceProtocol {
    
    var isSignupMethodsCalled: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completion: @escaping (SignUpResponseModel?, SignupError?) -> Void) {
        
        isSignupMethodsCalled = true
        
        let responseModel = SignUpResponseModel(status: "ok")
        completion(responseModel, nil)
    }
    
}
