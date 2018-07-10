//
//  Encounters.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Methods by which the player might can encounter Pokémon in the wild, e.g., walking in tall grass. Check out Bulbapedia for greater detail.
open class PKMEncounterMethod: Codable {
    
    /// The identifier for this encounter method resource
    open var id: Int?
    
    /// The name for this encounter method resource
    open var name: String?
    
    /// A good value for sorting
    open var order: Int?
    
    /// The name of this encounter method listed in different languages
    open var names: [PKMName]?
}


/// Encounter Condition
open class PKMEncounterCondition: Codable {
    
    /// The identifier for this encounter condition resource
    open var id: Int?
    
    /// The name for this encounter condition resource
    open var name: String?
    
    /// A list of possible values for this encounter condition
    open var values: [PKMNamedAPIResource<PKMEncounterConditionValue>]?
    
    /// The name of this encounter method listed in different languages
    open var names: [PKMName]?
}


/// Encounter Condition Value
open class PKMEncounterConditionValue: Codable {
    
    /// The identifier for this encounter condition value resource
    open var id: Int?
    
    /// The name for this encounter condition value resource
    open var name: String?
    
    /// The condition this encounter condition value pertains to
    open var condition: [PKMNamedAPIResource<PKMEncounterCondition>]?
    
    /// The name of this encounter condition value listed in different languages
    open var names: [PKMName]?
}



// MARK: - Web Services

open class EncounterService {
    /**
     Fetch Encounter Methods list
     */
    public func fetchEncounterMethodList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>>) -> Void) where T: PKMEncounterMethod {
        let urlStr = baseURL + "/encounter-method"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Encounter Method Information
     
     - parameter encounterMethodId: Encounter Method ID
     */
    public func fetchEncounterMethod(_ encounterMethodId: String, completion: @escaping (_ result: Result<PKMEncounterMethod>) -> Void) {
        let urlStr = baseURL + "/encounter-method/" + encounterMethodId
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Conditions list
     */
    public func fetchEncounterConditionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>>) -> Void) where T: PKMEncounterCondition {
        let urlStr = baseURL + "/encounter-condition"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Encounter Condition Information
     
     - parameter encounterConditionId: Encounter Condition ID
     */
    public func fetchEncounterCondition(_ encounterConditionId: String, completion: @escaping (_ result: Result<PKMEncounterCondition>) -> Void) {
        let urlStr = baseURL + "/encounter-condition/" + encounterConditionId
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Encounter Condition Values list
     */
    public func fetchEncounterConditionValueList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>>) -> Void) where T: PKMEncounterConditionValue {
        let urlStr = baseURL + "/encounter-condition-value"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Encounter Condition Value Information
     
     - parameter encounterConditionValueId: Encounter Condition Value ID
     */
    public func fetchEncounterConditionValue(_ encounterConditionValueId: String, completion: @escaping (_ result: Result<PKMEncounterConditionValue>) -> Void) {
        let urlStr = baseURL + "/encounter-condition-value/" + encounterConditionValueId
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
