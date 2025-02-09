//
//  EncounterService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMEncounterService: HTTPWebService {
    func fetchEncounterMethodList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEncounterMethod
    func fetchEncounterMethod(_ encounterMethodID: Int) async throws -> PKMEncounterMethod
    func fetchEncounterMethod(_ encounterMethodName: String) async throws -> PKMEncounterMethod
    func fetchEncounterConditionList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEncounterCondition
    func fetchEncounterCondition(_ encounterConditionID: Int) async throws -> PKMEncounterCondition
    func fetchEncounterCondition(_ encounterConditionName: String) async throws -> PKMEncounterCondition
    func fetchEncounterConditionValueList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEncounterConditionValue
    func fetchEncounterConditionValue(_ encounterConditionValueID: Int) async throws -> PKMEncounterConditionValue
    func fetchEncounterConditionValue(_ encounterConditionValueName: String) async throws -> PKMEncounterConditionValue
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
    public func fetchEncounterMethodList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEncounterMethod {
        try await callPaginated(endpoint: API.fetchEncounterMethodList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Encounter Method Information
     
     - parameter encounterMethodID: Encounter Method ID
     */
    public func fetchEncounterMethod(_ encounterMethodID: Int) async throws -> PKMEncounterMethod {
        try await PKMEncounterMethod.decode(from: call(endpoint: API.fetchEncounterMethodByID(encounterMethodID)))
    }
    
    
    /**
     Fetch Encounter Method Information
     
     - parameter encounterMethodName: Encounter Method Name
     */
    public func fetchEncounterMethod(_ encounterMethodName: String) async throws -> PKMEncounterMethod {
        try await PKMEncounterMethod.decode(from: call(endpoint: API.fetchEncounterMethodByName(encounterMethodName)))
    }
    
    
    /**
     Fetch Encounter Conditions list
     */
    public func fetchEncounterConditionList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEncounterCondition {
        try await callPaginated(endpoint: API.fetchEncounterConditionList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Encounter Method Information
     
     - parameter encounterMethodID: Encounter Method ID
     */
    public func fetchEncounterCondition(_ encounterConditionID: Int) async throws -> PKMEncounterCondition {
        try await PKMEncounterCondition.decode(from: call(endpoint: API.fetchEncounterConditionByID(encounterConditionID)))
    }
    
    
    /**
     Fetch Encounter Method Information
     
     - parameter encounterMethodName: Encounter Method Name
     */
    public func fetchEncounterCondition(_ encounterConditionName: String) async throws -> PKMEncounterCondition {
        try await PKMEncounterCondition.decode(from: call(endpoint: API.fetchEncounterConditionByName(encounterConditionName)))
    }
    
    
    /**
     Fetch Encounter Condition Values list
     */
    public func fetchEncounterConditionValueList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEncounterConditionValue {
        try await callPaginated(endpoint: API.fetchEncounterConditionValueList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Encounter Condition Value Information
     
     - parameter encounterConditionValueID: Encounter Condition Value ID
     */
    public func fetchEncounterConditionValue(_ encounterConditionValueID: Int) async throws -> PKMEncounterConditionValue {
        try await PKMEncounterConditionValue.decode(from: call(endpoint: API.fetchEncounterConditionValueByID(encounterConditionValueID)))
    }
    
    
    /**
     Fetch Encounter Condition Value Information
     
     - parameter encounterConditionValueName: Encounter Condition Value Name
     */
    public func fetchEncounterConditionValue(_ encounterConditionValueName: String) async throws -> PKMEncounterConditionValue {
        try await PKMEncounterConditionValue.decode(from: call(endpoint: API.fetchEncounterConditionValueByName(encounterConditionValueName)))
    }
}
