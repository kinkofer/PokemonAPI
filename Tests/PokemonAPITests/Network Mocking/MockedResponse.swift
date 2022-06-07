//
//  MockedResponse.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/24/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation
@testable import PokemonAPI


extension RequestMocking {
    struct MockedResponse {
        let url: URL
        let result: Result<Data, Swift.Error>
        let httpCode: Int
        let headers: [String: String]
        let loadingTime: TimeInterval
        let customResponse: URLResponse?
        
        static let mockHeaderKey = "x-mockHeaderKey"
    }
}



extension RequestMocking.MockedResponse {
    enum Error: Swift.Error {
        case failedMockCreation
    }
    
    
    init<T>(apiCall: APICall, baseURL: String, paginationState: PaginationState<T>, result: Result<Data, Swift.Error>,
            httpCode: Int = 200, headers: [HTTPHeader] = [.contentType(.json)],
            loadingTime: TimeInterval = 0.1) throws where T: Codable {
        guard let url = apiCall.createUrl(baseURL: baseURL, paginationState: paginationState) else { throw Error.failedMockCreation }
        
        self.init(url: url, result: result, httpCode: httpCode, headers: headers, loadingTime: loadingTime)
    }
    
    
    init(apiCall: APICall, baseURL: String, result: Result<Data, Swift.Error>,
         httpCode: Int = 200, headers: [HTTPHeader] = [.contentType(.json)],
         loadingTime: TimeInterval = 0.1) throws {
        guard let url = apiCall.createUrl(baseURL: baseURL) else { throw Error.failedMockCreation }
        
        self.init(url: url, result: result, httpCode: httpCode, headers: headers, loadingTime: loadingTime)
    }
    
    
    private init(url: URL, result: Result<Data, Swift.Error>,
                 httpCode: Int = 200, headers: [HTTPHeader] = [.contentType(.json)],
                 loadingTime: TimeInterval = 0.1) {
        self.url = url
        self.result = result
        self.httpCode = httpCode
        self.headers = Dictionary(headers.map { ($0.key, $0.value) }) { _, last in last }
        self.loadingTime = loadingTime
        customResponse = nil
    }
}


extension Result where Success: Hashable {
    var hashValue: Int {
        switch self {
        case .success(let data):
            return data.hashValue
        case .failure(let error):
            return error.localizedDescription.hashValue
        }
    }
}
