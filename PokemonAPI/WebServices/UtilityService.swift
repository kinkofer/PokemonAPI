//
//  UtilityService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMUtilityService: HTTPWebService {
    func fetchLanguageList(paginationState: PaginationState<PKMLanguage>) async throws -> PKMPagedObject<PKMLanguage>
    func fetchLanguage(_ languageID: Int) async throws -> PKMLanguage
    func fetchLanguage(_ languageName: String) async throws -> PKMLanguage
}



// MARK: - Web Services

public struct UtilityService: PKMUtilityService, Sendable {
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
    
    
    
    /**
     Fetch Languages list
     */
    public func fetchLanguageList(paginationState: PaginationState<PKMLanguage> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMLanguage> {
        try await callPaginated(endpoint: API.fetchLanuageList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageID: Language ID
     */
    public func fetchLanguage(_ languageID: Int) async throws -> PKMLanguage {
        try await PKMLanguage.decode(from: call(endpoint: API.fetchLanguageByID(languageID)))
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageName: Language Name
     */
    public func fetchLanguage(_ languageName: String) async throws -> PKMLanguage {
        try await PKMLanguage.decode(from: call(endpoint: API.fetchLanguageByName(languageName)))
    }
}
