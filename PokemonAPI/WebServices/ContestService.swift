//
//  ContestService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMContestService: HTTPWebService {
    func fetchContestTypeList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMContestType
    func fetchContestType(_ contestTypeID: Int, completion: @escaping (_ result: Result<PKMContestType, Error>) -> Void)
    func fetchContestType(_ contestTypeName: String, completion: @escaping (_ result: Result<PKMContestType, Error>) -> Void)
    func fetchContestEffectList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMContestEffect
    func fetchContestEffect(_ contestEffectID: Int, completion: @escaping (_ result: Result<PKMContestEffect, Error>) -> Void)
    func fetchSuperContestEffectList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMSuperContestEffect
    func fetchSuperContestEffect(_ superContestEffectID: Int, completion: @escaping (_ result: Result<PKMSuperContestEffect, Error>) -> Void)
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchContestTypeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMContestType
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchContestType(_ contestTypeID: Int) async throws -> PKMContestType
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchContestType(_ contestTypeName: String) async throws -> PKMContestType
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchContestEffectList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMContestEffect
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchContestEffect(_ contestEffectID: Int) async throws -> PKMContestEffect
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchSuperContestEffectList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMSuperContestEffect
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchSuperContestEffect(_ superContestEffectID: Int) async throws -> PKMSuperContestEffect
}



// MARK: - Web Services

public struct ContestService: PKMContestService {
    public enum API: APICall {
        case fetchContestTypeList
        case fetchContestTypeByID(Int)
        case fetchContestTypeByName(String)
        case fetchContestEffectList
        case fetchContestEffect(Int)
        case fetchSuperContestEffectList
        case fetchSuperContestEffect(Int)
        
        
        var path: String {
            switch self {
            case .fetchContestTypeList:
                return "/contest-type"
            case .fetchContestTypeByID(let id):
                return "/contest-type/\(id)"
            case .fetchContestTypeByName(let name):
                return "/contest-type/\(name)"
            case .fetchContestEffectList:
                return "/contest-effect"
            case .fetchContestEffect(let id):
                return "/contest-effect/\(id)"
            case .fetchSuperContestEffectList:
                return "/super-contest-effect"
            case .fetchSuperContestEffect(let id):
                return "/super-contest-effect/\(id)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Contest list
     */
    public func fetchContestTypeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMContestType {
        callPaginated(endpoint: API.fetchContestTypeList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeID: Contest Type ID
     */
    public func fetchContestType(_ contestTypeID: Int, completion: @escaping (_ result: Result<PKMContestType, Error>) -> Void) {
        call(endpoint: API.fetchContestTypeByID(contestTypeID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeName: Contest Type Name
     */
    public func fetchContestType(_ contestTypeName: String, completion: @escaping (_ result: Result<PKMContestType, Error>) -> Void) {
        call(endpoint: API.fetchContestTypeByName(contestTypeName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Contest Effects list
     */
    public func fetchContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMContestEffect {
        callPaginated(endpoint: API.fetchContestEffectList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Contest Effect Information
     
     - parameter contestEffectID: Contest Effect ID
     */
    public func fetchContestEffect(_ contestEffectID: Int, completion: @escaping (_ result: Result<PKMContestEffect, Error>) -> Void) {
        call(endpoint: API.fetchContestEffect(contestEffectID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Super Contest Effects list
     */
    public func fetchSuperContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMSuperContestEffect {
        callPaginated(endpoint: API.fetchSuperContestEffectList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Super Contest Effect Information
     
     - parameter superContestEffectID: Super Contest Effect ID
     */
    public func fetchSuperContestEffect(_ superContestEffectID: Int, completion: @escaping (_ result: Result<PKMSuperContestEffect, Error>) -> Void) {
        call(endpoint: API.fetchSuperContestEffect(superContestEffectID)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Async Services

extension ContestService {
    /**
     Fetch Contest list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchContestTypeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMContestType {
        try await callPaginated(endpoint: API.fetchContestTypeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeID: Contest Type ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchContestType(_ contestTypeID: Int) async throws -> PKMContestType {
        try await PKMContestType.decode(from: call(endpoint: API.fetchContestTypeByID(contestTypeID)))
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeName: Contest Type Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchContestType(_ contestTypeName: String) async throws -> PKMContestType {
        try await PKMContestType.decode(from: call(endpoint: API.fetchContestTypeByName(contestTypeName)))
    }
    
    
    /**
     Fetch Contest Effects list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMContestEffect {
        try await callPaginated(endpoint: API.fetchContestEffectList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Contest Effect Information
     
     - parameter contestEffectID: Contest Effect ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchContestEffect(_ contestEffectID: Int) async throws -> PKMContestEffect {
        try await PKMContestEffect.decode(from: call(endpoint: API.fetchContestEffect(contestEffectID)))
    }
    
    
    /**
     Fetch Super Contest Effects list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchSuperContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMSuperContestEffect {
        try await callPaginated(endpoint: API.fetchSuperContestEffectList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Super Contest Effect Information
     
     - parameter superContestEffectID: Super Contest Effect ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchSuperContestEffect(_ superContestEffectID: Int) async throws -> PKMSuperContestEffect {
        try await PKMSuperContestEffect.decode(from: call(endpoint: API.fetchSuperContestEffect(superContestEffectID)))
    }
}
