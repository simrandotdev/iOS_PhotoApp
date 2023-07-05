//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-07-05.
//

import XCTest
@testable import PhotoApp


final class SignupViewControllerTests: XCTestCase {
    
    private var storyboard: UIStoryboard!
    private var sut: SignupViewController!

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        
        // Act
        sut?.loadViewIfNeeded()
        
        let firstNameTextField = try XCTUnwrap(sut?.userFirstNameTextField)
        let lastNameTextField = try XCTUnwrap(sut?.userLastNameTextField)
        let emailTextField = try XCTUnwrap(sut?.userEmailTextField)
        let passwordTextField = try XCTUnwrap(sut?.userPasswordTextField)
        let repeatPasswordTextField = try XCTUnwrap(sut?.userRepeatPasswordTextField)
        
        // Assert
        XCTAssertEqual(firstNameTextField.text, "")
        XCTAssertEqual(lastNameTextField.text, "")
        XCTAssertEqual(emailTextField.text, "")
        XCTAssertEqual(passwordTextField.text, "")
        XCTAssertEqual(repeatPasswordTextField.text, "")
    }
    
    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        
        // Act
        sut?.loadViewIfNeeded()
        let signupButton = try XCTUnwrap(sut?.signupButton)
        let signupButtonActions = signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        
        // Assert
        
        XCTAssertEqual(signupButtonActions?.count, 1)
        XCTAssertTrue(signupButtonActions?.contains("signupButtonAction:") ?? false)
    }
}
