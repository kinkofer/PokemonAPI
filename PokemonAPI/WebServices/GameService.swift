//
//  GameService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMGameService: HTTPWebService {
    func fetchGenerationList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMGeneration
    func fetchGeneration(_ generationID: Int, completion: @escaping (_ result: Result<PKMGeneration, Error>) -> Void)
    func fetchGeneration(_ generationName: String, completion: @escaping (_ result: Result<PKMGeneration, Error>) -> Void)
    func fetchPokedexList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokedex
    func fetchPokedex(_ pokedexID: Int, completion: @escaping (_ result: Result<PKMPokedex, Error>) -> Void)
    func fetchPokedex(_ pokedexName: String, completion: @escaping (_ result: Result<PKMPokedex, Error>) -> Void)
    func fetchVersionList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMVersion
    func fetchVersion(_ versionID: Int, completion: @escaping (_ result: Result<PKMVersion, Error>) -> Void)
    func fetchVersion(_ versionName: String, completion: @escaping (_ result: Result<PKMVersion, Error>) -> Void)
    func fetchVersionGroupList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMVersionGroup
    func fetchVersionGroup(_ versionGroupID: Int, completion: @escaping (_ result: Result<PKMVersionGroup, Error>) -> Void)
    func fetchVersionGroup(_ versionGroupName: String, completion: @escaping (_ result: Result<PKMVersionGroup, Error>) -> Void)
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchGenerationList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMGeneration
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchGeneration(_ generationID: Int) -> AnyPublisher<PKMGeneration, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchGeneration(_ generationName: String) -> AnyPublisher<PKMGeneration, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchPokedexList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMPokedex
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchPokedex(_ pokedexID: Int) -> AnyPublisher<PKMPokedex, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchPokedex(_ pokedexName: String) -> AnyPublisher<PKMPokedex, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchVersionList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMVersion
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchVersion(_ versionID: Int) -> AnyPublisher<PKMVersion, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchVersion(_ versionName: String) -> AnyPublisher<PKMVersion, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchVersionGroupList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMVersionGroup
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchVersionGroup(_ versionGroupID: Int) -> AnyPublisher<PKMVersionGroup, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchVersionGroup(_ versionGroupName: String) -> AnyPublisher<PKMVersionGroup, Error>
    
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchGenerationList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMGeneration
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchGeneration(_ generationID: Int) async throws -> PKMGeneration
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchGeneration(_ generationName: String) async throws -> PKMGeneration
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchPokedexList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokedex
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchPokedex(_ pokedexID: Int) async throws -> PKMPokedex
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchPokedex(_ pokedexName: String) async throws -> PKMPokedex
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchVersionList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMVersion
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchVersion(_ versionID: Int) async throws -> PKMVersion
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchVersion(_ versionName: String) async throws -> PKMVersion
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchVersionGroupList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMVersionGroup
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchVersionGroup(_ versionGroupID: Int) async throws -> PKMVersionGroup
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchVersionGroup(_ versionGroupName: String) async throws -> PKMVersionGroup
}



// MARK: - Web Services

public struct GameService: PKMGameService {
    public enum API: APICall {
        case fetchGenerationList
        case fetchGenerationByID(Int)
        case fetchGenerationByName(String)
        case fetchPokedexList
        case fetchPokedexByID(Int)
        case fetchPokedexByName(String)
        case fetchVersionList
        case fetchVersionByID(Int)
        case fetchVersionByName(String)
        case fetchVersionGroupList
        case fetchVersionGroupByID(Int)
        case fetchVersionGroupByName(String)
        
        
        var path: String {
            switch self {
            case .fetchGenerationList:
                return "/generation"
            case .fetchGenerationByID(let id):
                return "/generation/\(id)"
            case .fetchGenerationByName(let name):
                return "/generation/\(name)"
            case .fetchPokedexList:
                return "/pokedex"
            case .fetchPokedexByID(let id):
                return "/pokedex/\(id)"
            case .fetchPokedexByName(let name):
                return "/pokedex/\(name)"
            case .fetchVersionList:
                return "/version"
            case .fetchVersionByID(let id):
                return "/version/\(id)"
            case .fetchVersionByName(let name):
                return "/version/\(name)"
            case .fetchVersionGroupList:
                return "/version-group"
            case .fetchVersionGroupByID(let id):
                return "/version-group/\(id)"
            case .fetchVersionGroupByName(let name):
                return "/version-group/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Generations list
     */
    public func fetchGenerationList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMGeneration {
        callPaginated(endpoint: API.fetchGenerationList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationID: Generation ID
     */
    public func fetchGeneration(_ generationID: Int, completion: @escaping (_ result: Result<PKMGeneration, Error>) -> Void) {
        call(endpoint: API.fetchGenerationByID(generationID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationName: Generation Name
     */
    public func fetchGeneration(_ generationName: String, completion: @escaping (_ result: Result<PKMGeneration, Error>) -> Void) {
        call(endpoint: API.fetchGenerationByName(generationName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokedex list
     */
    public func fetchPokedexList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokedex {
        callPaginated(endpoint: API.fetchPokedexList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexID: Pokedex ID
     */
    public func fetchPokedex(_ pokedexID: Int, completion: @escaping (_ result: Result<PKMPokedex, Error>) -> Void) {
        call(endpoint: API.fetchPokedexByID(pokedexID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexName: Pokedex Name
     */
    public func fetchPokedex(_ pokedexName: String, completion: @escaping (_ result: Result<PKMPokedex, Error>) -> Void) {
        call(endpoint: API.fetchPokedexByName(pokedexName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Versions list
     */
    public func fetchVersionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMVersion {
        callPaginated(endpoint: API.fetchVersionList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionID: Version ID
     */
    public func fetchVersion(_ versionID: Int, completion: @escaping (_ result: Result<PKMVersion, Error>) -> Void) {
        call(endpoint: API.fetchVersionByID(versionID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionName: Version Name
     */
    public func fetchVersion(_ versionName: String, completion: @escaping (_ result: Result<PKMVersion, Error>) -> Void) {
        call(endpoint: API.fetchVersionByName(versionName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Versions Groups list
     */
    public func fetchVersionGroupList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMVersionGroup {
        callPaginated(endpoint: API.fetchVersionGroupList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Version Group Information
     
     - parameter versionGroupID: Version Group ID
     */
    public func fetchVersionGroup(_ versionGroupID: Int, completion: @escaping (_ result: Result<PKMVersionGroup, Error>) -> Void) {
        call(endpoint: API.fetchVersionGroupByID(versionGroupID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Version Group Information
     
     - parameter versionGroupName: Version Group Name
     */
    public func fetchVersionGroup(_ versionGroupName: String, completion: @escaping (_ result: Result<PKMVersionGroup, Error>) -> Void) {
        call(endpoint: API.fetchVersionGroupByName(versionGroupName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension GameService {
    /**
     Fetch Generations list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchGenerationList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMGeneration {
        callPaginated(endpoint: API.fetchGenerationList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationID: Generation ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchGeneration(_ generationID: Int) -> AnyPublisher<PKMGeneration, Error> {
        call(endpoint: API.fetchGenerationByID(generationID))
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationName: Generation Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchGeneration(_ generationName: String) -> AnyPublisher<PKMGeneration, Error> {
        call(endpoint: API.fetchGenerationByName(generationName))
    }
    
    
    /**
     Fetch Pokedex list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchPokedexList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMPokedex {
        callPaginated(endpoint: API.fetchPokedexList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexID: Pokedex ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchPokedex(_ pokedexID: Int) -> AnyPublisher<PKMPokedex, Error> {
        call(endpoint: API.fetchPokedexByID(pokedexID))
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexName: Pokedex Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchPokedex(_ pokedexName: String) -> AnyPublisher<PKMPokedex, Error> {
        call(endpoint: API.fetchPokedexByName(pokedexName))
    }
    
    
    /**
     Fetch Versions list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchVersionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMVersion {
        callPaginated(endpoint: API.fetchVersionList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionID: Version ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchVersion(_ versionID: Int) -> AnyPublisher<PKMVersion, Error> {
        call(endpoint: API.fetchVersionByID(versionID))
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionName: Version Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchVersion(_ versionName: String) -> AnyPublisher<PKMVersion, Error> {
        call(endpoint: API.fetchVersionByName(versionName))
    }
    
    
    /**
     Fetch Versions Groups list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchVersionGroupList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMVersionGroup {
        callPaginated(endpoint: API.fetchVersionGroupList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Versions Groups list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchVersionGroup(_ versionGroupID: Int) -> AnyPublisher<PKMVersionGroup, Error> {
        call(endpoint: API.fetchVersionGroupByID(versionGroupID))
    }
    
    
    /**
     Fetch Version Group Information
     
     - parameter versionGroupName: Version Group Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchVersionGroup(_ versionGroupName: String) -> AnyPublisher<PKMVersionGroup, Error> {
        call(endpoint: API.fetchVersionGroupByName(versionGroupName))
    }
}



// MARK: - Async Services

extension GameService {
    /**
     Fetch Generations list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGenerationList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMGeneration {
        try await callPaginated(endpoint: API.fetchGenerationList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationID: Generation ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGeneration(_ generationID: Int) async throws -> PKMGeneration {
        try await PKMGeneration.decode(from: call(endpoint: API.fetchGenerationByID(generationID)))
    }
    
    
    /**
     Fetch Generation Information
     
     - parameter generationName: Generation Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGeneration(_ generationName: String) async throws -> PKMGeneration {
        try await PKMGeneration.decode(from: call(endpoint: API.fetchGenerationByName(generationName)))
    }
    
    
    /**
     Fetch Pokedex list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokedexList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokedex {
        try await callPaginated(endpoint: API.fetchPokedexList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexID: Pokedex ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokedex(_ pokedexID: Int) async throws -> PKMPokedex {
        try await PKMPokedex.decode(from: call(endpoint: API.fetchGenerationByID(pokedexID)))
    }
    
    
    /**
     Fetch Pokedex Information
     
     - parameter pokedexName: Pokedex Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokedex(_ pokedexName: String) async throws -> PKMPokedex {
        try await PKMPokedex.decode(from: call(endpoint: API.fetchGenerationByName(pokedexName)))
    }
    
    
    /**
     Fetch Versions list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchVersionList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMVersion {
        try await callPaginated(endpoint: API.fetchVersionList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionID: Version ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchVersion(_ versionID: Int) async throws -> PKMVersion {
        try await PKMVersion.decode(from: call(endpoint: API.fetchGenerationByID(versionID)))
    }
    
    
    /**
     Fetch Version Information
     
     - parameter versionName: Version Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchVersion(_ versionName: String) async throws -> PKMVersion {
        try await PKMVersion.decode(from: call(endpoint: API.fetchGenerationByName(versionName)))
    }
    
    
    /**
     Fetch Versions Groups list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchVersionGroupList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMVersionGroup {
        try await callPaginated(endpoint: API.fetchVersionGroupList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Versions Groups list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchVersionGroup(_ versionGroupID: Int) async throws -> PKMVersionGroup {
        try await PKMVersionGroup.decode(from: call(endpoint: API.fetchVersionGroupByID(versionGroupID)))
    }
    
    
    /**
     Fetch Version Group Information
     
     - parameter versionGroupName: Version Group Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchVersionGroup(_ versionGroupName: String) async throws -> PKMVersionGroup {
        try await PKMVersionGroup.decode(from: call(endpoint: API.fetchVersionGroupByName(versionGroupName)))
    }
}
