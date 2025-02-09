//
//  RequestMocking.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/24/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation
@testable import PokemonAPI


extension URLSession {
    static var mockedResponsesOnly: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [RequestMocking.self, RequestBlocking.self]
        configuration.timeoutIntervalForRequest = 1
        configuration.timeoutIntervalForResource = 1
        return URLSession(configuration: configuration)
    }
}


final class RequestMocking: URLProtocol, @unchecked Sendable {
    static nonisolated(unsafe) private var mocks: [MockedResponse] = []
    
    
    override class func canInit(with request: URLRequest) -> Bool {
        return mock(for: request) != nil
    }

    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    
    override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return false
    }

    
    override func startLoading() {
        guard let mock = RequestMocking.mock(for: request),
            let url = request.url,
            let response = mock.customResponse ??
                HTTPURLResponse(url: url, statusCode: mock.httpCode, httpVersion: "HTTP/1.1", headerFields: mock.headers) else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + mock.loadingTime) { [weak self] in
            guard let self = self else { return }
            
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            
            switch mock.result {
            case let .success(data):
                self.client?.urlProtocol(self, didLoad: data)
                self.client?.urlProtocolDidFinishLoading(self)
            case let .failure(error):
                // Embed custom error in userInfo[NSUnderlyingErrorKey], to be extracted later
                let failure = NSError(domain: NSURLErrorDomain, code: 1, userInfo: [NSUnderlyingErrorKey: error])
                self.client?.urlProtocol(self, didFailWithError: failure)
            }
        }
    }
    

    override func stopLoading() { }
}



extension RequestMocking {
    static func add(mock: MockedResponse) {
        mocks.append(mock)
    }
    
    static func removeAllMocks() {
        mocks.removeAll()
    }
    
    static private func mock(for request: URLRequest) -> MockedResponse? {
        return mocks.first { mock in
            guard let url = request.url else { return false }
            return mock.url.compareComponents(url)
        }
    }
}



// MARK: - RequestBlocking

/// If RequestMocking fails to find a MockedResponse, RequestBlocking will prevent the session from using default protocols (i.e. making a real call)
private class RequestBlocking: URLProtocol, @unchecked Sendable {
    enum Error: Swift.Error {
        case requestBlocked
    }

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        DispatchQueue(label: "").async {
            self.client?.urlProtocol(self, didFailWithError: Error.requestBlocked)
        }
    }
    override func stopLoading() { }
}
