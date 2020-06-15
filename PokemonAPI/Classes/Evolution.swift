//
//  Evolution.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Evolution Chain
open class PKMEvolutionChain: Codable, SelfDecodable {
    
    /// The identifier for this evolution chain resource
    open var id: Int?
    
    /// The item that a Pokémon would be holding when mating that would trigger the egg hatching a baby Pokémon rather than a basic Pokémon
    open var babyTriggerItem: PKMNamedAPIResource<PKMItem>?
    
    /// The base chain link object. Each link contains evolution details for a Pokémon in the chain. Each link references the next Pokémon in the natural evolution order.
    open var chain: PKMClainLink?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Clain Link
open class PKMClainLink: Codable, SelfDecodable {
    
    /// Whether or not this link is for a baby Pokémon. This would only ever be true on the base link.
    open var isBaby: Bool?
    
    /// The Pokémon species at this point in the evolution chain
    open var species: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    /// All details regarding the specific details of the referenced Pokémon species evolution
    open var evolutionDetails: [PKMEvolutionDetail]?
    
    /// A List of chain objects.
    open var evolvesTo: [PKMClainLink]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Evolution Detail
open class PKMEvolutionDetail: Codable, SelfDecodable {
    
    /// The item required to cause evolution this into Pokémon species
    open var item: PKMNamedAPIResource<PKMItem>?
    
    /// The type of event that triggers evolution into this Pokémon species
    open var trigger: PKMNamedAPIResource<PKMEvolutionTrigger>?
    
    /// The id of the gender of the evolving Pokémon species must be in order to evolve into this Pokémon species
    open var gender: Int?
    
    /// The item the evolving Pokémon species must be holding during the evolution
    open var heldItem: PKMNamedAPIResource<PKMItem>?
    
    /// The move that must be known by the evolving Pokémon species during the evolution trigger event in order to evolve into this Pokémon species
    open var knownMove: PKMNamedAPIResource<PKMMove>?
    
    /// The evolving Pokémon species must know a move with this type during the evolution trigger event in order to evolve into this Pokémon species
    open var knownMoveType: PKMNamedAPIResource<PKMType>?
    
    /// The location the evolution must be triggered at.
    open var location: PKMNamedAPIResource<PKMLocation>?
    
    /// The minimum required level of the evolving Pokémon species to evolve into this Pokémon species
    open var minLevel: Int?
    
    /// The minimum required level of happiness the evolving Pokémon species to evolve into this Pokémon species
    open var minHappiness: Int?
    
    /// The minimum required level of beauty the evolving Pokémon species to evolve into this Pokémon species
    open var minBeauty: Int?
    
    /// The minimum required level of affection the evolving Pokémon species to evolve into this Pokémon species
    open var minAffection: Int?
    
    /// Whether or not it must be raining in the overworld to cause evolution this Pokémon species
    open var needsOverworldRain: Bool?
    
    /// The pokemon species that must be in the players party in order for the evolving Pokémon species to evolve into this Pokémon species
    open var partySpecies: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    /// The player must have a pokemon of this type in their party during the evolution trigger event in order for the evolving Pokémon species to evolve into this Pokémon species
    open var partyType: PKMNamedAPIResource<PKMType>?
    
    /// The required relation between the Pokémon's Attack and Defense stats. 1 means Attack > Defense. 0 means Attack = Defense. -1 means Attack < Defense.
    open var relativePhysicalStats: Int?
    
    /// The required time of day. Day or night.
    open var timeOfDay: String?
    
    /// Pokémon species for which this one must be traded.
    open var tradeSpecies: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    /// Whether or not the 3DS needs to be turned upside-down as this Pokémon levels up.
    open var turnUpsideDown: Bool?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Evolution triggers are the events and conditions that cause a pokemon to evolve. Check out Bulbapedia for greater detail.
open class PKMEvolutionTrigger: Codable, SelfDecodable {
    
    /// The identifier for this evolution trigger resource
    open var id: Int?
    
    /// The name for this evolution trigger resource
    open var name: String?
    
    /// The name of this evolution trigger listed in different languages
    open var names: [PKMName]?
    
    /// A list of pokemon species that result from this evolution trigger
    open var pokemonSpecies: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
