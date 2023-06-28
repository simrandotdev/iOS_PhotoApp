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
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let sut = SignupWebService(urlString: "https://appsdeveloperblog.com:8080/signup-mock-service/users", urlSession: urlSession)
        
        let signupFormRequestModel = SignupFormRequestModel(firstName: "Sergery", lastName: "Kargopolov", email: "test@test.com", password: "123456789")
        
        let expection = expectation(description: "Signup Web Service Response Expectation")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupFormResponseModel, error) in
            // Assert
            // "{\"status\": \"ok\"}"
            XCTAssertEqual(signupFormResponseModel?.status, "ok")
            expection.fulfill()
        }

        wait(for: [expection], timeout: 5)
    }
}
