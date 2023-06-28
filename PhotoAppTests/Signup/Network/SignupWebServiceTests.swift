//
//  SignupWebServiceTests.swift
//  PhotoAppUITests
//
//  Created by Simran Preet Narang on 2023-06-22.
//

import XCTest
@testable import PhotoApp

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: "https://appsdeveloperblog.com:8080/signup-mock-service/users", urlSession: urlSession)
        
        signupFormRequestModel = SignupFormRequestModel(firstName: "Sergery", lastName: "Kargopolov", email: "test@test.com", password: "123456789")
    }
    
    
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Arrange
        
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
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
    
    
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = """
{"path": "/users", "error": "Internal Server Error"}
"""
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expection = expectation(description: "Signup() method expectation for a response the contains a different JSON Structure")
        
        // Act
        sut.signup(withForm: signupFormRequestModel) { (signupFormResponseModel, error) in
            // Assert
            XCTAssertNil(signupFormResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsingError, "The error should be model parsing error but found something different")
            expection.fulfill()
        }

        wait(for: [expection], timeout: 5)
    }
    
    
    override func tearDownWithError() throws {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
}
