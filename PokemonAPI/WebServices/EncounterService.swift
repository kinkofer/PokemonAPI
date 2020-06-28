//
//  EncounterService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMEncounterService: HTTPWebService {
    func fetchEncounterMethodList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEncounterMethod
    func fetchEncounterMethod(_ encounterMethodID: Int, completion: @escaping (_ result: Result<PKMEncounterMethod, Error>) -> Void)
    func fetchEncounterMethod(_ encounterMethodName: String, completion: @escaping (_ result: Result<PKMEncounterMethod, Error>) -> Void)
    func fetchEncounterConditionList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEncounterCondition
    func fetchEncounterCondition(_ encounterConditionID: Int, completion: @escaping (_ result: Result<PKMEncounterCondition, Error>) -> Void)
    func fetchEncounterCondition(_ encounterConditionName: String, completion: @escaping (_ result: Result<PKMEncounterCondition, Error>) -> Void)
    func fetchEncounterConditionValueList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEncounterConditionValue
    func fetchEncounterConditionValue(_ encounterConditionValueID: Int, completion: @escaping (_ result: Result<PKMEncounterConditionValue, Error>) -> Void)
    func fetchEncounterConditionValue(_ encounterConditionValueName: String, completion: @escaping (_ result: Result<PKMEncounterConditionValue, Error>) -> Void)
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterMethodList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEncounterMethod
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterMethod(_ encounterMethodID: Int) -> AnyPublisher<PKMEncounterMethod, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterMethod(_ encounterMethodName: String) -> AnyPublisher<PKMEncounterMethod, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterConditionList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEncounterCondition
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterCondition(_ encounterConditionID: Int) -> AnyPublisher<PKMEncounterCondition, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterCondition(_ encounterConditionName: String) -> AnyPublisher<PKMEncounterCondition, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterConditionValueList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEncounterConditionValue
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterConditionValue(_ encounterConditionValueID: Int) -> AnyPublisher<PKMEncounterConditionValue, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchEncounterConditionValue(_ encounterConditionValueName: String) -> AnyPublisher<PKMEncounterConditionValue, Error>
}




// MARK: - Web Services

public struct EncounterService: PKMEncounterService {
    public enum API: APICall {
        case fetchEncounterMethodList
        case fetchEncounterMethodByID(Int)
        case fetchEncounterMethodByName(String)
        case fetchEncounterConditionList
        case fetchEncounterConditionByID(Int)
        case fetchEncounterConditionByName(String)
        case fetchEncounterConditionValueList
        case fetchEncounterConditionValueByID(Int)
        case fetchEncounterConditionValueByName(String)
        
        
        var path: String {
            switch self {
            case .fetchEncounterMethodList:
                return "/encounter-method"
            case .fetchEncounterMethodByID(let id):
                return "/encounter-method/\(id)"
            case .fetchEncounterMethodByName(let name):
                return "/encounter-method/\(name)"
            case .fetchEncounterConditionList:
                return "/encounter-condition"
            case .fetchEncounterConditionByID(let id):
                return "/encounter-condition/\(id)"
            case .fetchEncounterConditionByName(let name):
                return "/encounter-condition/\(name)"
            case .fetchEncounterConditionValueList:
                return "/encounter-condition-value"
            case .fetchEncounterConditionValueByID(let id):
                return "/encounter-condition-value/\(id)"
            case .fetchEncounterConditionValueByName(let name):
                return "/encounter-condition-value/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    /**
     Fetch Encounter Methods list
     */
    public func fetchEncounterMethodList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEncounterMethod {
        callPaginated(endpoint: API.fetchEncounterMethodList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Encounter Method Information
     
     - parameter encounterMethodID: Encounter Method ID
     */
    public func fetchEncounterMethod(_ encounterMethodID: Int, completion: @escaping (_ result: Result<PKMEncounterMethod, Error>) -> Void) {
        call(endpoint: API.fetchEncounterMethodByID(encounterMethodID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Method Information
     
     - parameter encounterMethodName: Encounter Method Name
     */
    public func fetchEncounterMethod(_ encounterMethodName: String, completion: @escaping (_ result: Result<PKMEncounterMethod, Error>) -> Void) {
        call(endpoint: API.fetchEncounterMethodByName(encounterMethodName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Conditions list
     */
    public func fetchEncounterConditionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEncounterCondition {
        callPaginated(endpoint: API.fetchEncounterMethodList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Encounter Condition Information
     
     - parameter encounterConditionID: Encounter Condition ID
     */
    public func fetchEncounterCondition(_ encounterConditionID: Int, completion: @escaping (_ result: Result<PKMEncounterCondition, Error>) -> Void) {
        call(endpoint: API.fetchEncounterConditionByID(encounterConditionID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Condition Information
     
     - parameter encounterConditionName: Encounter Condition Name
     */
    public func fetchEncounterCondition(_ encounterConditionName: String, completion: @escaping (_ result: Result<PKMEncounterCondition, Error>) -> Void) {
        call(endpoint: API.fetchEncounterConditionByName(encounterConditionName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Condition Values list
     */
    public func fetchEncounterConditionValueList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEncounterConditionValue {
        callPaginated(endpoint: API.fetchEncounterConditionValueList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Encounter Condition Value Information
     
     - parameter encounterConditionValueID: Encounter Condition Value ID
     */
    public func fetchEncounterConditionValue(_ encounterConditionValueID: Int, completion: @escaping (_ result: Result<PKMEncounterConditionValue, Error>) -> Void) {
        call(endpoint: API.fetchEncounterConditionValueByID(encounterConditionValueID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Condition Value Information
     
     - parameter encounterConditionValueName: Encounter Condition Value Name
     */
    public func fetchEncounterConditionValue(_ encounterConditionValueName: String, completion: @escaping (_ result: Result<PKMEncounterConditionValue, Error>) -> Void) {
        call(endpoint: API.fetchEncounterConditionValueByName(encounterConditionValueName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension EncounterService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterMethodList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEncounterMethod {
        callPaginated(endpoint: API.fetchEncounterMethodList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterMethod(_ encounterMethodID: Int) -> AnyPublisher<PKMEncounterMethod, Error> {
        call(endpoint: API.fetchEncounterMethodByID(encounterMethodID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterMethod(_ encounterMethodName: String) -> AnyPublisher<PKMEncounterMethod, Error> {
        call(endpoint: API.fetchEncounterMethodByName(encounterMethodName))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterConditionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEncounterCondition {
        callPaginated(endpoint: API.fetchEncounterConditionList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterCondition(_ encounterConditionID: Int) -> AnyPublisher<PKMEncounterCondition, Error> {
        call(endpoint: API.fetchEncounterConditionByID(encounterConditionID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterCondition(_ encounterConditionName: String) -> AnyPublisher<PKMEncounterCondition, Error> {
        call(endpoint: API.fetchEncounterConditionByName(encounterConditionName))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterConditionValueList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMEncounterConditionValue {
        callPaginated(endpoint: API.fetchEncounterConditionValueList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterConditionValue(_ encounterConditionValueID: Int) -> AnyPublisher<PKMEncounterConditionValue, Error> {
        call(endpoint: API.fetchEncounterConditionValueByID(encounterConditionValueID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchEncounterConditionValue(_ encounterConditionValueName: String) -> AnyPublisher<PKMEncounterConditionValue, Error> {
        call(endpoint: API.fetchEncounterConditionValueByName(encounterConditionValueName))
    }
}
