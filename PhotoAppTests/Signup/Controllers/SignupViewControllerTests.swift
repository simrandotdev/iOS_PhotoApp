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

    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() {
        
        // Act
        sut?.loadViewIfNeeded()
        
        // Assert
        XCTAssertEqual(sut?.userFirstNameTextField.text, "")
        XCTAssertEqual(sut?.userLastNameTextField.text, "")
        XCTAssertEqual(sut?.userEmailTextField.text, "")
        XCTAssertEqual(sut?.userPasswordTextField.text, "")
        XCTAssertEqual(sut?.userRepeatPasswordTextField.text, "")
    }
}
