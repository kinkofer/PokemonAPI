//
//  ResourceService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMResourceService: HTTPWebService {
    func fetch<T: Decodable>(_ resource: PKMAPIResource<T>, completion: @escaping (_ result: Result<T, Error>) -> Void)
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetch<T: Decodable>(_ resource: PKMAPIResource<T>) -> AnyPublisher<T, Error>
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
    
    // Resources do not need a baseURL, the full URL is in the PKMAPIResource itself.
    public var baseURL: String = ""
    
    
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



// MARK: - Combine Services

extension ResourceService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetch<T: Decodable>(_ resource: PKMAPIResource<T>) -> AnyPublisher<T, Error> {
        call(endpoint: API.fetchResource(resource))
    }
}
