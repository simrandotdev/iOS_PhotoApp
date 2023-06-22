//
//  SignupWebServiceTests.swift
//  PhotoAppUITests
//
//  Created by Simran Preet Narang on 2023-06-22.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        let sut = SignupWebService()
        
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Sergery", lastName: "Kargopolov", email: "test@test.com", password: "123456789")
        sut.signup(withForm: signupFormRequestModel) { (signupFormResponseModel, error) in
            
        }
    }
}
