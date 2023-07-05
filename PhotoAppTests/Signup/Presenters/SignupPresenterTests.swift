//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-06-30.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignUpWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var sut: SignupPresenter!

    override func setUpWithError() throws {
        // Arrange
        signupFormModel = SignupFormModel(firstName: "Sergery",
                                              lastName: "Brin",
                                              email: "serger@gmail.com",
                                              password: "password",
                                              repeatPassword: "password")
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignUpWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator, signupViewDelegate: mockSignupViewDelegate, signupWebService: mockSignupWebService)
    }

    override func tearDownWithError() throws {
        
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.doPasswordsMatch, "Password do not match")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodsCalled, "Signup method was not called in SignUpWebService class.")
        
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelete() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
    }
}
