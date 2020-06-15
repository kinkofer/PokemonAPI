//
//  APICall.swift
//  Pods-PokemonAPI-Example
//
//  Created by Christopher Jennewein on 6/13/20.
//

import Foundation


protocol APICall {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [HTTPHeader]? { get }
    func body() throws -> Data?
}


extension APICall {
    func getUrlRequest(baseURL: String) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw HTTPError.invalidRequest
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            request.addHeaders(headers)
        }
        request.httpBody = try body()
        return request
    }
    
    
    func getPaginatedUrlRequest<T>(baseURL: String, paginationState: PaginationState<T>) throws -> URLRequest {
        guard var url = URL(string: baseURL + path) else {
            throw HTTPError.invalidRequest
        }
        
        // Append pageLimit and offset to url
        var pageLimit = 0
        var offset = 0
        
        switch paginationState {
        case .initial(pageLimit: let limit):
            pageLimit = limit
        case .continuing(let paginatedResult, let relationship):
            pageLimit = paginatedResult.limit
            offset = paginatedResult.getOffset(for: relationship)
        }
        
        url.appendQuery(parameters: ["limit": String(pageLimit),
                                     "offset": String(offset)])
        
        var request = URLRequest(url: url)
        
        
        request.httpMethod = method.rawValue
        if let headers = headers {
            request.addHeaders(headers)
        }
        request.httpBody = try body()
        return request
    }
}
