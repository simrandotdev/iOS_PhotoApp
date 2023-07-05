//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-07-03.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    
    func successfulSignup() {
        
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        
    }
}
