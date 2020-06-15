//
//  Locations.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Locations that can be visited within the games. Locations make up sizable portions of regions, like cities or routes.
open class PKMLocation: Codable, SelfDecodable {
    
    /// The identifier for this location resource
    open var id: Int?
    
    /// The name for this location resource
    open var name: String?
    
    /// The region this location can be found in
    open var region: PKMNamedAPIResource<PKMRegion>?
    
    /// The name of this language listed in different languages
    open var names: [PKMName]?
    
    /// A list of game indices relevent to this location by generation
    open var gameIndices: [PKMGenerationGameIndex]?
    
    /// Areas that can be found within this location
    open var areas: [PKMNamedAPIResource<PKMLocationArea>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Location Areas

/// Location areas are sections of areas, such as floors in a building or cave. Each area has its own set of possible Pokémon encounters.
open class PKMLocationArea: Codable, SelfDecodable {
    
    /// The identifier for this location resource
    open var id: Int?
    
    /// The name for this location resource
    open var name: String?
    
    /// The internal id of an API resource within game data
    open var gameIndex: Int?
    
    /// A list of methods in which Pokémon may be encountered in this area and how likely the method will occur depending on the version of the game
    open var encounterMethodRates: [PKMEncounterMethodRate]?
    
    /// The region this location can be found in
    open var location: PKMNamedAPIResource<PKMLocation>?
    
    /// The name of this location area listed in different languages
    open var names: [PKMName]?
    
    /// A list of Pokémon that can be encountered in this area along with version specific details about the encounter
    open var pokemonEncounters: [PKMPokemonEncounter]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Encounter Method Rate
open class PKMEncounterMethodRate: Codable, SelfDecodable {
    
    /// The method in which Pokémon may be encountered in an area.
    open var encounterMethod: PKMEncounterMethod?
    
    /// The chance of the encounter to occur on a version of the game.
    open var versionDetails: [PKMEncounterVersionDetails]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Encounter Version Details
open class PKMEncounterVersionDetails: Codable {
    
    /// The chance of an encounter to occur.
    open var rate: Int?
    
    /// The version of the game in which the encounter can occur with the given chance.
    open var version: PKMNamedAPIResource<PKMVersion>?
}


/// Pokemon Encounter
open class PKMPokemonEncounter: Codable, SelfDecodable {
    
    /// The Pokémon being encountered
    open var pokemon: PKMNamedAPIResource<PKMPokemon>?
    
    /// A list of versions and encounters with Pokémon that might happen in the referenced location area
    open var versionDetails: [PKMVersionEncounterDetail]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Pal Park Areas

/// Pal Park Area
open class PKMPalParkArea: Codable, SelfDecodable {
    
    /// The identifier for this pal park area resource
    open var id: Int?
    
    /// The name for this pal park area resource
    open var name: String?
    
    /// The name of this pal park area listed in different languages
    open var names: [PKMName]?
    
    /// A list of Pokémon encountered in thi pal park area along with details
    open var pokemonEncounters: [PKMPalParkEncounterSpecies]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Areas used for grouping Pokémon encounters in Pal Park. They're like habitats that are specific to Pal Park.
open class PKMPalParkEncounterSpecies: Codable, SelfDecodable {
    
    /// The base score given to the player when this Pokémon is caught during a pal park run
    open var baseScore: Int?
    
    /// The base rate for encountering this Pokémon in this pal park area
    open var rate: Int?
    
    /// The Pokémon species being encountered
    open var pokemonSpecies: PKMNamedAPIResource<PKMPokemonSpecies>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Regions

/// A region is an organized area of the Pokémon world. Most often, the main difference between regions is the species of Pokémon that can be encountered within them.
open class PKMRegion: Codable, SelfDecodable {
    
    /// The identifier for this region resource
    open var id: Int?
    
    /// The name for this region resource
    open var name: String?
    
    /// A list of locations that can be found in this region
    open var locations: [PKMNamedAPIResource<PKMLocation>]?
    
    /// The generation this region was introduced in
    open var mainGeneration: PKMNamedAPIResource<PKMGeneration>?
    
    /// The name of this region listed in different languages
    open var names: [PKMName]?
    
    /// A list of pokédexes that catalogue Pokémon in this region
    open var pokedexes: [PKMNamedAPIResource<PKMPokedex>]?
    
    /// A list of version groups where this region can be visited
    open var versionGroups: [PKMNamedAPIResource<PKMVersionGroup>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
