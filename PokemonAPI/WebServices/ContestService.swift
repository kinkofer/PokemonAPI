//
//  ContestService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMContestService: HTTPWebService {
    func fetchContestTypeList(paginationState: PaginationState<PKMContestType>) async throws -> PKMPagedObject<PKMContestType>
    func fetchContestType(_ contestTypeID: Int) async throws -> PKMContestType
    func fetchContestType(_ contestTypeName: String) async throws -> PKMContestType
    func fetchContestEffectList(paginationState: PaginationState<PKMContestEffect>) async throws -> PKMPagedObject<PKMContestEffect>
    func fetchContestEffect(_ contestEffectID: Int) async throws -> PKMContestEffect
    func fetchSuperContestEffectList(paginationState: PaginationState<PKMSuperContestEffect>) async throws -> PKMPagedObject<PKMSuperContestEffect>
    func fetchSuperContestEffect(_ superContestEffectID: Int) async throws -> PKMSuperContestEffect
}



// MARK: - Web Services

public struct ContestService: PKMContestService, Sendable {
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
    public func fetchContestTypeList(paginationState: PaginationState<PKMContestType> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMContestType> {
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
    public func fetchContestEffectList(paginationState: PaginationState<PKMContestEffect> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMContestEffect> {
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
    public func fetchSuperContestEffectList(paginationState: PaginationState<PKMSuperContestEffect> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMSuperContestEffect> {
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
