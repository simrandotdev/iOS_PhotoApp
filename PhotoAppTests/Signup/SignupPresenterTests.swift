//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-06-30.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        let signupFormModel = SignupFormModel(firstName: "Sergery",
                                              lastName: "Brin",
                                              email: "serger@gmail.com",
                                              password: "password",
                                              repeatPassword: "password")
        let mockSignupModelValidator = MockSignupModelValidator()
        
        let sut = SignupPresenter(formModelValidator: mockSignupModelValidator)
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.doPasswordsMatch, "Password do not match")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
    }
}
