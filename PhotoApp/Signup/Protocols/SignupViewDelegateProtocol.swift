//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-07-03.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
 
