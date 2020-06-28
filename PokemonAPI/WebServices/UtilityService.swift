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
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchLanguageList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLanguage
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchLanguage(_ languageID: Int) -> AnyPublisher<PKMLanguage, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchLanguage(_ languageName: String) -> AnyPublisher<PKMLanguage, Error>
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
    
    
    
    // MARK: - Language
    
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
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchLanguageList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLanguage {
        callPaginated(endpoint: API.fetchLanuageList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchLanguage(_ languageID: Int) -> AnyPublisher<PKMLanguage, Error> {
        call(endpoint: API.fetchLanguageByID(languageID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchLanguage(_ languageName: String) -> AnyPublisher<PKMLanguage, Error> {
        call(endpoint: API.fetchLanguageByName(languageName))
    }
}
