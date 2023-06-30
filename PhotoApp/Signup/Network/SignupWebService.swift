//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-22.
//

import Foundation

class SignupWebService {
    
    private var urlString: String
    private var urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = URLSession.shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(
        withForm formModel: SignupFormRequestModel,
        completion: @escaping (SignUpResponseModel?, SignupError?) -> Void) {
            guard let url = URL(string: urlString) else {
                completion(nil, .invalidRequestURLString)
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            request.httpBody = try? JSONEncoder().encode(formModel)
            
            let dataTask = urlSession.dataTask(with: request) { data, urlResponse, error in
                
                if let error {
                    print("❌", error.localizedDescription)
                    completion(nil, .failedRequest(description: error.localizedDescription))
                    return
                }
                
                if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data) {
                    completion(signupResponseModel, nil)
                } else {
                    completion(nil, SignupError.responseModelParsingError)
                }
            }
            dataTask.resume()
    }
}
