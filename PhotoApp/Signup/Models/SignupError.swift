//
//  SignupError.swift
//  PhotoApp
//
//  Created by Simran Preet Narang on 2023-06-22.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case responseModelParsingError
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .responseModelParsingError:
            return "Error parsing JSON of the response"
        case .invalidRequestURLString:
            return "URL you are trying to call seems to be invalid"
        case .failedRequest(let description):
            print("😀", description)
            return description
        }
    }
}
