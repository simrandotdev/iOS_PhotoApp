//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Simran Preet Narang on 2023-06-26.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let stubResponseData = MockURLProtocol.stubResponseData {
            self.client?.urlProtocol(self, didLoad: stubResponseData)
        }
        
        if let error = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: error)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
