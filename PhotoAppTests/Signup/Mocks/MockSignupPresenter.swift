//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-07-05.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
