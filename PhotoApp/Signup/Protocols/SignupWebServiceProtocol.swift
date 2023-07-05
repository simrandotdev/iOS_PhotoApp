//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-07-03.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(
        withForm formModel: SignupFormRequestModel,
        completion: @escaping (SignUpResponseModel?, SignupError?) -> Void)
}
