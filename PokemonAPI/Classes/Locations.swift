//
//  Locations.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Locations that can be visited within the games. Locations make up sizable portions of regions, like cities or routes.
public struct PKMLocation: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this location resource
    public let id: Int?
    
    /// The name for this location resource
    public let name: String?
    
    /// The region this location can be found in
    public let region: PKMAPIResource<PKMRegion>?
    
    /// The name of this language listed in different languages
    public let names: [PKMName]?
    
    /// A list of game indices relevent to this location by generation
    public let gameIndices: [PKMGenerationGameIndex]?
    
    /// Areas that can be found within this location
    public let areas: [PKMAPIResource<PKMLocationArea>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Location Areas

/// Location areas are sections of areas, such as floors in a building or cave. Each area has its own set of possible Pokémon encounters.
public struct PKMLocationArea: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this location resource
    public let id: Int?
    
    /// The name for this location resource
    public let name: String?
    
    /// The internal id of an API resource within game data
    public let gameIndex: Int?
    
    /// A list of methods in which Pokémon may be encountered in this area and how likely the method will occur depending on the version of the game
    public let encounterMethodRates: [PKMEncounterMethodRate]?
    
    /// The region this location can be found in
    public let location: PKMAPIResource<PKMLocation>?
    
    /// The name of this location area listed in different languages
    public let names: [PKMName]?
    
    /// A list of Pokémon that can be encountered in this area along with version specific details about the encounter
    public let pokemonEncounters: [PKMPokemonEncounter]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Encounter Method Rate
public struct PKMEncounterMethodRate: Codable, SelfDecodable, Sendable {
    
    /// The method in which Pokémon may be encountered in an area.
    public let encounterMethod: PKMEncounterMethod?
    
    /// The chance of the encounter to occur on a version of the game.
    public let versionDetails: [PKMEncounterVersionDetails]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Encounter Version Details
public struct PKMEncounterVersionDetails: Codable, Sendable {
    
    /// The chance of an encounter to occur.
    public let rate: Int?
    
    /// The version of the game in which the encounter can occur with the given chance.
    public let version: PKMAPIResource<PKMVersion>?
}


/// Pokemon Encounter
public struct PKMPokemonEncounter: Codable, SelfDecodable, Sendable {
    
    /// The Pokémon being encountered
    public let pokemon: PKMAPIResource<PKMPokemon>?
    
    /// A list of versions and encounters with Pokémon that might happen in the referenced location area
    public let versionDetails: [PKMVersionEncounterDetail]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pal Park Areas

/// Pal Park Area
public struct PKMPalParkArea: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this pal park area resource
    public let id: Int?
    
    /// The name for this pal park area resource
    public let name: String?
    
    /// The name of this pal park area listed in different languages
    public let names: [PKMName]?
    
    /// A list of Pokémon encountered in this pal park area along with details
    public let pokemonEncounters: [PKMPalParkEncounterSpecies]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Areas used for grouping Pokémon encounters in Pal Park. They're like habitats that are specific to Pal Park.
public struct PKMPalParkEncounterSpecies: Codable, SelfDecodable, Sendable {
    
    /// The base score given to the player when this Pokémon is caught during a pal park run
    public let baseScore: Int?
    
    /// The base rate for encountering this Pokémon in this pal park area
    public let rate: Int?
    
    /// The Pokémon species being encountered
    public let pokemonSpecies: PKMAPIResource<PKMPokemonSpecies>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Regions

/// A region is an organized area of the Pokémon world. Most often, the main difference between regions is the species of Pokémon that can be encountered within them.
public struct PKMRegion: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this region resource
    public let id: Int?
    
    /// The name for this region resource
    public let name: String?
    
    /// A list of locations that can be found in this region
    public let locations: [PKMAPIResource<PKMLocation>]?
    
    /// The generation this region was introduced in
    public let mainGeneration: PKMAPIResource<PKMGeneration>?
    
    /// The name of this region listed in different languages
    public let names: [PKMName]?
    
    /// A list of pokédexes that catalogue Pokémon in this region
    public let pokedexes: [PKMAPIResource<PKMPokedex>]?
    
    /// A list of version groups where this region can be visited
    public let versionGroups: [PKMAPIResource<PKMVersionGroup>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
