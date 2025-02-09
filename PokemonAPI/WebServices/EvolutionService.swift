//
//  EvolutionService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMEvolutionService: HTTPWebService {
    func fetchEvolutionChainList(paginationState: PaginationState<PKMEvolutionChain>) async throws -> PKMPagedObject<PKMEvolutionChain>
    func fetchEvolutionChain(_ evolutionChainID: Int) async throws -> PKMEvolutionChain
    func fetchEvolutionTriggerList(paginationState: PaginationState<PKMEvolutionTrigger>) async throws -> PKMPagedObject<PKMEvolutionTrigger>
    func fetchEvolutionTrigger(_ evolutionTriggerID: Int) async throws -> PKMEvolutionTrigger
    func fetchEvolutionTrigger(_ evolutionTriggerName: String) async throws -> PKMEvolutionTrigger
}



// MARK: - Web Services

public struct EvolutionService: PKMEvolutionService, Sendable {
    public enum API: APICall {
        case fetchEvolutionChainList
        case fetchEvolutionChain(Int)
        case fetchEvolutionTriggerList
        case fetchEvolutionTriggerByID(Int)
        case fetchEvolutionTriggerByName(String)
        
        var path: String {
            switch self {
            case .fetchEvolutionChainList:
                return "/evolution-chain"
            case .fetchEvolutionChain(let id):
                return "/evolution-chain/\(id)"
            case .fetchEvolutionTriggerList:
                return "/evolution-trigger"
            case .fetchEvolutionTriggerByID(let id):
                return "/evolution-trigger/\(id)"
            case .fetchEvolutionTriggerByName(let name):
                return "/evolution-trigger/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    /**
     Fetch Encounter Chains list
     */
    public func fetchEvolutionChainList(paginationState: PaginationState<PKMEvolutionChain> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMEvolutionChain> {
        try await callPaginated(endpoint: API.fetchEvolutionChainList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Evolution Chain Information
     
     - parameter evolutionChainID: Evolution Chain ID
     */
    public func fetchEvolutionChain(_ evolutionChainID: Int) async throws -> PKMEvolutionChain {
        try await PKMEvolutionChain.decode(from: call(endpoint: API.fetchEvolutionChain(evolutionChainID)))
    }
    
    
    /**
     Fetch Encounter Triggers list
     */
    public func fetchEvolutionTriggerList(paginationState: PaginationState<PKMEvolutionTrigger> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMEvolutionTrigger> {
        try await callPaginated(endpoint: API.fetchEvolutionTriggerList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Evolution Trigger Information
     
     - parameter evolutionTriggerID: Evolution Trigger ID
     */
    public func fetchEvolutionTrigger(_ evolutionTriggerID: Int) async throws -> PKMEvolutionTrigger {
        try await PKMEvolutionTrigger.decode(from: call(endpoint: API.fetchEvolutionTriggerByID(evolutionTriggerID)))
    }
    
    
    /**
     Fetch Evolution Trigger Information
     
     - parameter evolutionTriggerName: Evolution Trigger Name
     */
    public func fetchEvolutionTrigger(_ evolutionTriggerName: String) async throws -> PKMEvolutionTrigger {
        try await PKMEvolutionTrigger.decode(from: call(endpoint: API.fetchEvolutionTriggerByName(evolutionTriggerName)))
    }
}
