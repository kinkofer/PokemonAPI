//
//  Evolution.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Evolution Chain
public struct PKMEvolutionChain: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this evolution chain resource
    public let id: Int?
    
    /// The item that a Pokémon would be holding when mating that would trigger the egg hatching a baby Pokémon rather than a basic Pokémon
    public let babyTriggerItem: PKMAPIResource<PKMItem>?
    
    /// The base chain link object. Each link contains evolution details for a Pokémon in the chain. Each link references the next Pokémon in the natural evolution order.
    public let chain: PKMChainLink?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Chain Link
public struct PKMChainLink: Codable, SelfDecodable, Sendable {
    
    /// Whether or not this link is for a baby Pokémon. This would only ever be true on the base link.
    public let isBaby: Bool?
    
    /// The Pokémon species at this point in the evolution chain
    public let species: PKMAPIResource<PKMPokemonSpecies>?
    
    /// All details regarding the specific details of the referenced Pokémon species evolution
    public let evolutionDetails: [PKMEvolutionDetail]?
    
    /// A List of chain objects.
    public let evolvesTo: [PKMChainLink]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Evolution Detail
public struct PKMEvolutionDetail: Codable, SelfDecodable, Sendable {
    
    /// The item required to cause evolution this into Pokémon species
    public let item: PKMAPIResource<PKMItem>?
    
    /// The type of event that triggers evolution into this Pokémon species
    public let trigger: PKMAPIResource<PKMEvolutionTrigger>?
    
    /// The id of the gender of the evolving Pokémon species must be in order to evolve into this Pokémon species
    public let gender: Int?
    
    /// The item the evolving Pokémon species must be holding during the evolution
    public let heldItem: PKMAPIResource<PKMItem>?
    
    /// The move that must be known by the evolving Pokémon species during the evolution trigger event in order to evolve into this Pokémon species
    public let knownMove: PKMAPIResource<PKMMove>?
    
    /// The evolving Pokémon species must know a move with this type during the evolution trigger event in order to evolve into this Pokémon species
    public let knownMoveType: PKMAPIResource<PKMType>?
    
    /// The location the evolution must be triggered at.
    public let location: PKMAPIResource<PKMLocation>?
    
    /// The minimum required level of the evolving Pokémon species to evolve into this Pokémon species
    public let minLevel: Int?
    
    /// The minimum required level of happiness the evolving Pokémon species to evolve into this Pokémon species
    public let minHappiness: Int?
    
    /// The minimum required level of beauty the evolving Pokémon species to evolve into this Pokémon species
    public let minBeauty: Int?
    
    /// The minimum required level of affection the evolving Pokémon species to evolve into this Pokémon species
    public let minAffection: Int?
    
    /// Whether or not it must be raining in the overworld to cause evolution this Pokémon species
    public let needsOverworldRain: Bool?
    
    /// The pokemon species that must be in the players party in order for the evolving Pokémon species to evolve into this Pokémon species
    public let partySpecies: PKMAPIResource<PKMPokemonSpecies>?
    
    /// The player must have a pokemon of this type in their party during the evolution trigger event in order for the evolving Pokémon species to evolve into this Pokémon species
    public let partyType: PKMAPIResource<PKMType>?
    
    /// The required relation between the Pokémon's Attack and Defense stats. 1 means Attack > Defense. 0 means Attack = Defense. -1 means Attack < Defense.
    public let relativePhysicalStats: Int?
    
    /// The required time of day. Day or night.
    public let timeOfDay: String?
    
    /// Pokémon species for which this one must be traded.
    public let tradeSpecies: PKMAPIResource<PKMPokemonSpecies>?
    
    /// Whether or not the 3DS needs to be turned upside-down as this Pokémon levels up.
    public let turnUpsideDown: Bool?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Evolution triggers are the events and conditions that cause a pokemon to evolve. Check out Bulbapedia for greater detail.
public struct PKMEvolutionTrigger: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this evolution trigger resource
    public let id: Int?
    
    /// The name for this evolution trigger resource
    public let name: String?
    
    /// The name of this evolution trigger listed in different languages
    public let names: [PKMName]?
    
    /// A list of pokemon species that result from this evolution trigger
    public let pokemonSpecies: PKMAPIResource<PKMPokemonSpecies>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
