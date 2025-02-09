//
//  ContestService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMContestService: HTTPWebService {
    func fetchContestTypeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMContestType
    func fetchContestType(_ contestTypeID: Int) async throws -> PKMContestType
    func fetchContestType(_ contestTypeName: String) async throws -> PKMContestType
    func fetchContestEffectList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMContestEffect
    func fetchContestEffect(_ contestEffectID: Int) async throws -> PKMContestEffect
    func fetchSuperContestEffectList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMSuperContestEffect
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
    
    
    
    /**
     Fetch Contest list
     */
    public func fetchContestTypeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMContestType {
        try await callPaginated(endpoint: API.fetchContestTypeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeID: Contest Type ID
     */
    public func fetchContestType(_ contestTypeID: Int) async throws -> PKMContestType {
        try await PKMContestType.decode(from: call(endpoint: API.fetchContestTypeByID(contestTypeID)))
    }
    
    
    /**
     Fetch Contest Type Information
     
     - parameter contestTypeName: Contest Type Name
     */
    public func fetchContestType(_ contestTypeName: String) async throws -> PKMContestType {
        try await PKMContestType.decode(from: call(endpoint: API.fetchContestTypeByName(contestTypeName)))
    }
    
    
    /**
     Fetch Contest Effects list
     */
    public func fetchContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMContestEffect {
        try await callPaginated(endpoint: API.fetchContestEffectList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Contest Effect Information
     
     - parameter contestEffectID: Contest Effect ID
     */
    public func fetchContestEffect(_ contestEffectID: Int) async throws -> PKMContestEffect {
        try await PKMContestEffect.decode(from: call(endpoint: API.fetchContestEffect(contestEffectID)))
    }
    
    
    /**
     Fetch Super Contest Effects list
     */
    public func fetchSuperContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMSuperContestEffect {
        try await callPaginated(endpoint: API.fetchSuperContestEffectList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Super Contest Effect Information
     
     - parameter superContestEffectID: Super Contest Effect ID
     */
    public func fetchSuperContestEffect(_ superContestEffectID: Int) async throws -> PKMSuperContestEffect {
        try await PKMSuperContestEffect.decode(from: call(endpoint: API.fetchSuperContestEffect(superContestEffectID)))
    }
}
