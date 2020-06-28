//
//  EvolutionService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMEvolutionService: HTTPWebService {
    func fetchEvolutionChainList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEvolutionChain
    func fetchEvolutionChain(_ evolutionChainID: Int, completion: @escaping (_ result: Result<PKMEvolutionChain, Error>) -> Void)
    func fetchEvolutionTriggerList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEvolutionTrigger
    func fetchEvolutionTrigger(_ evolutionTriggerID: Int, completion: @escaping (_ result: Result<PKMEvolutionTrigger, Error>) -> Void)
    func fetchEvolutionTrigger(_ evolutionTriggerName: String, completion: @escaping (_ result: Result<PKMEvolutionTrigger, Error>) -> Void)
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEvolutionChainList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEvolutionChain
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEvolutionChain(_ evolutionChainID: Int) -> AnyPublisher<PKMEvolutionChain, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEvolutionTriggerList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEvolutionTrigger
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEvolutionTrigger(_ evolutionTriggerID: Int) -> AnyPublisher<PKMEvolutionTrigger, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEvolutionTrigger(_ evolutionTriggerName: String) -> AnyPublisher<PKMEvolutionTrigger, Error>
}



// MARK: - Web Services

public struct EvolutionService: PKMEvolutionService {
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
    public func fetchEvolutionChainList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEvolutionChain {
        callPaginated(endpoint: API.fetchEvolutionChainList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Evolution Chain Information
     
     - parameter evolutionChainID: Evolution Chain ID
     */
    public func fetchEvolutionChain(_ evolutionChainID: Int, completion: @escaping (_ result: Result<PKMEvolutionChain, Error>) -> Void) {
        call(endpoint: API.fetchEvolutionChain(evolutionChainID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Triggers list
     */
    public func fetchEvolutionTriggerList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEvolutionTrigger {
        callPaginated(endpoint: API.fetchEvolutionTriggerList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Evolution Trigger Information
     
     - parameter evolutionTriggerID: Evolution Trigger ID
     */
    public func fetchEvolutionTrigger(_ evolutionTriggerID: Int, completion: @escaping (_ result: Result<PKMEvolutionTrigger, Error>) -> Void) {
        call(endpoint: API.fetchEvolutionTriggerByID(evolutionTriggerID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Evolution Trigger Information
     
     - parameter evolutionTriggerName: Evolution Trigger Name
     */
    public func fetchEvolutionTrigger(_ evolutionTriggerName: String, completion: @escaping (_ result: Result<PKMEvolutionTrigger, Error>) -> Void) {
        call(endpoint: API.fetchEvolutionTriggerByName(evolutionTriggerName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension EvolutionService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEvolutionChainList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEvolutionChain {
        callPaginated(endpoint: API.fetchEvolutionChainList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEvolutionChain(_ evolutionChainID: Int) -> AnyPublisher<PKMEvolutionChain, Error> {
        call(endpoint: API.fetchEvolutionChain(evolutionChainID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEvolutionTriggerList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEvolutionTrigger {
        callPaginated(endpoint: API.fetchEvolutionTriggerList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEvolutionTrigger(_ evolutionTriggerID: Int) -> AnyPublisher<PKMEvolutionTrigger, Error> {
        call(endpoint: API.fetchEvolutionTriggerByID(evolutionTriggerID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEvolutionTrigger(_ evolutionTriggerName: String) -> AnyPublisher<PKMEvolutionTrigger, Error> {
        call(endpoint: API.fetchEvolutionTriggerByName(evolutionTriggerName))
    }
}
