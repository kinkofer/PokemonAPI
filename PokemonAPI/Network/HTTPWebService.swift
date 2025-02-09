//
//  HTTPWebService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


enum HTTPMethod: String {
    case get, post, put, delete, patch, head
}


public protocol HTTPWebService {
    var session: URLSession { get }
    var baseURL: String { get }
}



// MARK: - Completion Calls

extension HTTPWebService {
    func call(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) async throws -> Data {
        let request = try endpoint.createUrlRequest(baseURL: baseURL, method: method, headers: headers, body: body)
        return try await session.startData(request)
    }
    
    
    func callPaginated<T>(endpoint: APICall, paginationState: PaginationState<T>, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) async throws -> PKMPagedObject<T> where T: Decodable {
        let request = try endpoint.createUrlRequest(baseURL: baseURL, paginationState: paginationState, method: method, headers: headers, body: body)
        
        guard let url = request.url else {
            throw HTTPError.invalidRequest
        }
        
        let data = try await session.startData(request)
        let pagedObject = try PKMPagedObject<T>.decode(from: data)
        let newPagedObject = PKMPagedObject<T>(from: pagedObject, with: paginationState, currentUrl: url.absoluteString)
        return newPagedObject
    }
}
