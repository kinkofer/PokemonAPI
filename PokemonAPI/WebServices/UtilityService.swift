//
//  UtilityService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMUtilityService: HTTPWebService {
    func fetchLanguageList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMLanguage
    func fetchLanguage(_ languageID: Int, completion: @escaping (_ result: Result<PKMLanguage, Error>) -> Void)
    func fetchLanguage(_ languageName: String, completion: @escaping (_ result: Result<PKMLanguage, Error>) -> Void)
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchLanguageList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLanguage
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchLanguage(_ languageID: Int) -> AnyPublisher<PKMLanguage, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchLanguage(_ languageName: String) -> AnyPublisher<PKMLanguage, Error>
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchLanguageList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMLanguage
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchLanguage(_ languageID: Int) async throws -> PKMLanguage
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchLanguage(_ languageName: String) async throws -> PKMLanguage
}



// MARK: - Web Services

public struct UtilityService: PKMUtilityService {
    public enum API: APICall {
        case fetchLanuageList
        case fetchLanguageByID(Int)
        case fetchLanguageByName(String)
        
        var path: String {
            switch self {
            case .fetchLanuageList:
                return "/language"
            case .fetchLanguageByID(let id):
                return "/language/\(id)"
            case .fetchLanguageByName(let name):
                return "/language/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Languages list
     */
    public func fetchLanguageList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMLanguage {
        callPaginated(endpoint: API.fetchLanuageList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageID: Language ID
     */
    public func fetchLanguage(_ languageID: Int, completion: @escaping (_ result: Result<PKMLanguage, Error>) -> Void) {
        call(endpoint: API.fetchLanguageByID(languageID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageName: Language Name
     */
    public func fetchLanguage(_ languageName: String, completion: @escaping (_ result: Result<PKMLanguage, Error>) -> Void) {
        call(endpoint: API.fetchLanguageByName(languageName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension UtilityService {
    /**
     Fetch Languages list
     */
    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchLanguageList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLanguage {
        callPaginated(endpoint: API.fetchLanuageList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageID: Language ID
     */
    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchLanguage(_ languageID: Int) -> AnyPublisher<PKMLanguage, Error> {
        call(endpoint: API.fetchLanguageByID(languageID))
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageName: Language Name
     */
    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchLanguage(_ languageName: String) -> AnyPublisher<PKMLanguage, Error> {
        call(endpoint: API.fetchLanguageByName(languageName))
    }
}



// MARK: - Async Services

extension UtilityService {
    /**
     Fetch Languages list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchLanguageList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMLanguage {
        try await callPaginated(endpoint: API.fetchLanuageList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageID: Language ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchLanguage(_ languageID: Int) async throws -> PKMLanguage {
        try await PKMLanguage.decode(from: call(endpoint: API.fetchLanguageByID(languageID)))
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageName: Language Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchLanguage(_ languageName: String) async throws -> PKMLanguage {
        try await PKMLanguage.decode(from: call(endpoint: API.fetchLanguageByName(languageName)))
    }
}
