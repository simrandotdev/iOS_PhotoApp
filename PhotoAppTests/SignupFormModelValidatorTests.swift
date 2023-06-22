//
//  SignupFormModelValidatorTests.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-06-19.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sergery")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a very short first name but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "This name is a very long first name for testing purposes.")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a very long first name but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenLastNameValid_ShouldReturnTrue() {
        
        // Act
         let isLastNameValid = sut.isLastNameValid(lastName: "Paranove")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "S")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a very short last name but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "This name is a very long first name for testing purposes.")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a very long last name but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEmailValid_ShouldReturnTrue() {
        
        // Act
         let isEmailValid = sut.isEmailValid(email: "sergery@gmail.com")
        
        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooEmailProvided_ShouldReturnFalse() {
        // Act
        let isEmailValid = sut.isEmailValid(email: "S")
        
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a very short last name but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongEmailProvided_ShouldReturnFalse() {
        // Act
        let isEmailValid = sut.isEmailValid(email: "This email is a very long email for testing purposes.")
        
        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a very long email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordProvided_ShouldReturnTrue() {
        // Arrange
        let password1 = "password"
        let password2 = "password"
        
        let doPasswordsMatch = sut.doPasswordsMatch(password1, password2)
        
        XCTAssertTrue(doPasswordsMatch, "The doPasswordsMatch() should have returned TRUE for same passwords provided but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenDifferentPasswordProvided_ShouldReturnFalse() {
        // Arrange
        let password1 = "password"
        let password2 = "password1"
        
        // Act
        let doPasswordsMatch = sut.doPasswordsMatch(password1, password2)
        
        // Assert
        XCTAssertFalse(doPasswordsMatch, "The doPasswordsMatch() should have returned FALSE for different passwords provided but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "password")
        
        // Assert
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid 8 character password, but return FALSE")
    }
    
    func testSignupFormModelValidator_WhenShortPasswordProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "pas")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned False for a invalid short character password, but return TRUE")
    }
    
    func testSignupFormModelValidator_WhenLongPasswordProvided_ShouldReturnFalse() {
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "123456789123456789123456789123456789132457891345678913245891234567891345678913456794561324657894651345679461324657894613201465789646514861467")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned False for a invalid long character password, but return TRUE")
    }
    
}
