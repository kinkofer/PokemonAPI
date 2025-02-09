//
//  Encounters.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Methods by which the player might can encounter Pokémon in the wild, e.g., walking in tall grass. Check out Bulbapedia for greater detail.
public struct PKMEncounterMethod: Codable, Sendable {
    
    /// The identifier for this encounter method resource
    public let id: Int?
    
    /// The name for this encounter method resource
    public let name: String?
    
    /// A good value for sorting
    public let order: Int?
    
    /// The name of this encounter method listed in different languages
    public let names: [PKMName]?
}


/// Encounter Condition
public struct PKMEncounterCondition: Codable, Sendable {
    
    /// The identifier for this encounter condition resource
    public let id: Int?
    
    /// The name for this encounter condition resource
    public let name: String?
    
    /// A list of possible values for this encounter condition
    public let values: [PKMAPIResource<PKMEncounterConditionValue>]?
    
    /// The name of this encounter method listed in different languages
    public let names: [PKMName]?
}


/// Encounter Condition Value
public struct PKMEncounterConditionValue: Codable, Sendable {
    
    /// The identifier for this encounter condition value resource
    public let id: Int?
    
    /// The name for this encounter condition value resource
    public let name: String?
    
    /// The condition this encounter condition value pertains to
    public let condition: [PKMAPIResource<PKMEncounterCondition>]?
    
    /// The name of this encounter condition value listed in different languages
    public let names: [PKMName]?
}
