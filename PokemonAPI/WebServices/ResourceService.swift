//
//  ResourceService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMResourceService: HTTPWebService {
    func fetch<T: Decodable>(_ resource: PKMAPIResource<T>, completion: @escaping (_ result: Result<T, Error>) -> Void)
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetch<T: Decodable>(_ resource: PKMAPIResource<T>) async throws -> T
}



// MARK: - Web Services

public struct ResourceService: PKMResourceService {
    public enum API<T>: APICall {
        case fetchResource(PKMAPIResource<T>)
        
        var path: String {
            switch self {
            case .fetchResource(let resource):
                return resource.url ?? ""
            }
        }
    }
    
    public var session: URLSession
    
    // Resources do not need a baseURL, the full URL is in the PKMAPIResource itself, provided by the path.
    public var baseURL: String = ""
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch a resource from a named or unnamed resource url
     
     - parameter resource: PKMAPIResource or APINamedAPIResource
     */
    public func fetch<T: Decodable>(_ resource: PKMAPIResource<T>, completion: @escaping (_ result: Result<T, Error>) -> Void) {
        guard API.fetchResource(resource).path.isEmpty == false else {
            completion(.failure(HTTPError.invalidRequest))
            return
        }
        
        call(endpoint: API.fetchResource(resource)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Async Services

extension ResourceService {
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetch<T: Decodable>(_ resource: PKMAPIResource<T>) async throws -> T {
        try await T.decode(from: call(endpoint: API.fetchResource(resource)))
    }
}
