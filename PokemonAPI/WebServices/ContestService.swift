//
//  ContestService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMContestService: HTTPWebService {
    func fetchContestList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMContestType
    func fetchContestType(_ contestTypeID: Int, completion: @escaping (_ result: Result<PKMContestType, Error>) -> Void)
    func fetchContestType(_ contestTypeName: String, completion: @escaping (_ result: Result<PKMContestType, Error>) -> Void)
    func fetchContestEffectList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMContestEffect
    func fetchContestEffect(_ contestEffectID: Int, completion: @escaping (_ result: Result<PKMContestEffect, Error>) -> Void)
    func fetchSuperContestEffectList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMSuperContestEffect
    func fetchSuperContestEffect(_ superContestEffectID: Int, completion: @escaping (_ result: Result<PKMSuperContestEffect, Error>) -> Void)
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchContestList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMContestType
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchContestType(_ contestTypeID: Int) -> AnyPublisher<PKMContestType, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchContestType(_ contestTypeName: String) -> AnyPublisher<PKMContestType, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchContestEffectList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMContestEffect
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchContestEffect(_ contestEffectID: Int) -> AnyPublisher<PKMContestEffect, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchSuperContestEffectList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMSuperContestEffect
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchSuperContestEffect(_ superContestEffectID: Int) -> AnyPublisher<PKMSuperContestEffect, Error>
}



// MARK: - Web Services

public struct ContestService: PKMContestService {
    public enum API: APICall {
        case fetchContestList
        case fetchContestTypeByID(Int)
        case fetchContestTypeByName(String)
        case fetchContestEffectList
        case fetchContestEffect(Int)
        case fetchSuperContestEffectList
        case fetchSuperContestEffect(Int)
        
        
        var path: String {
            switch self {
            case .fetchContestList:
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
    public func fetchContestList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMContestType {
        callPaginated(endpoint: API.fetchContestList, paginationState: paginationState, completion: completion)
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



// MARK: - Combine Services

extension ContestService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchContestList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMContestType {
        callPaginated(endpoint: API.fetchContestList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchContestType(_ contestTypeID: Int) -> AnyPublisher<PKMContestType, Error> {
        call(endpoint: API.fetchContestTypeByID(contestTypeID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchContestType(_ contestTypeName: String) -> AnyPublisher<PKMContestType, Error> {
        call(endpoint: API.fetchContestTypeByName(contestTypeName))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMContestEffect {
        callPaginated(endpoint: API.fetchContestEffectList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchContestEffect(_ contestEffectID: Int) -> AnyPublisher<PKMContestEffect, Error> {
        call(endpoint: API.fetchContestEffect(contestEffectID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchSuperContestEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMSuperContestEffect {
        callPaginated(endpoint: API.fetchSuperContestEffectList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchSuperContestEffect(_ superContestEffectID: Int) -> AnyPublisher<PKMSuperContestEffect, Error> {
        call(endpoint: API.fetchSuperContestEffect(superContestEffectID))
    }
}
