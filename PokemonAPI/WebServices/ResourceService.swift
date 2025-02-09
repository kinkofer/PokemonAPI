//
//  ResourceService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMResourceService: HTTPWebService {
    func fetch<T: Decodable>(_ resource: PKMAPIResource<T>) async throws -> T
}



// MARK: - Web Services

public struct ResourceService: PKMResourceService, Sendable {
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
    public func fetch<T: Decodable>(_ resource: PKMAPIResource<T>) async throws -> T {
        try await T.decode(from: call(endpoint: API.fetchResource(resource)))
    }
}
