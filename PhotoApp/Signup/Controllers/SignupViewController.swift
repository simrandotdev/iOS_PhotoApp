//
//  ViewController.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-15.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    public var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if signupPresenter == nil {
            let validator = SignupFormModelValidator()
            let webservice = SignupWebService(urlString: "")
            signupPresenter = SignupPresenter(formModelValidator: validator, signupViewDelegate: self, signupWebService: webservice)
        }
    }

    @IBAction func signupButtonAction(_ sender: Any) {
        
        let signupFormModel = SignupFormModel(firstName: userFirstNameTextField.text ?? "",
                                              lastName: userLastNameTextField.text ?? "",
                                              email: userEmailTextField.text ?? "",
                                              password: userPasswordTextField.text ?? "",
                                              repeatPassword: userRepeatPasswordTextField.text ?? "")
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
    
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfulSignup() {
        
    }
    
    func errorHandler(error: SignupError) {
        
    }
}
