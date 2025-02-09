//
//  Games.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation



/// A generation is a grouping of the Pokémon games that separates them based on the Pokémon they include. In each generation, a new set of Pokémon, Moves, Abilities and Types that did not exist in the previous generation are released.
public struct PKMGeneration: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this generation resource
    public let id: Int?
    
    /// The name for this generation resource
    public let name: String?
    
    /// The name of this generation listed in different languages
    public let names: [PKMName]?
    
    /// A list of abilities that were introduced in this generation
    public let abilities: [PKMAPIResource<PKMAbility>]?
    
    /// The main region travelled in this generation
    public let mainRegion: PKMAPIResource<PKMRegion>?
    
    /// A list of moves that were introduced in this generation
    public let moves: [PKMAPIResource<PKMMove>]?
    
    /// A list of Pokémon species that were introduced in this generation
    public let pokemonSpecies: [PKMAPIResource<PKMPokemonSpecies>]?
    
    /// A list of types that were introduced in this generation
    public let types: [PKMAPIResource<PKMType>]?
    
    /// A list of version groups that were introduced in this generation
    public let versionGroups: [PKMAPIResource<PKMVersionGroup>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// A Pokédex is a handheld electronic encyclopedia device; one which is capable of recording and retaining information of the various Pokémon in a given region with the exception of the national dex and some smaller dexes related to portions of a region. See Bulbapedia for greater detail.
public struct PKMPokedex: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this Pokédex resource
    public let id: Int?
    
    /// The name for this Pokédex resource
    public let name: String?
    
    /// Whether or not this Pokédex originated in the main series of the video games
    public let isMainSeries: Bool?
    
    /// The description of this Pokédex listed in different languages
    public let descriptions: [PKMDescription]?
    
    /// The name of this Pokédex listed in different languages
    public let names: [PKMName]?
    
    /// A list of pokemon catalogued in this Pokédex and their indexes
    public let pokemonEntries: [PKMPokemonEntry]?
    
    /// The region this Pokédex catalogues pokemon for
    public let region: PKMAPIResource<PKMRegion>?
    
    /// A list of version groups this Pokédex is relevent to
    public let versionGroups: [PKMAPIResource<PKMVersionGroup>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pokemon Entry
public struct PKMPokemonEntry: Codable, SelfDecodable, Sendable {
    
    /// The index of this pokemon species entry within the Pokédex
    public let entryNumber: Int?
    
    /// The Pokémon species being encountered
    public let pokemonSpecies: PKMAPIResource<PKMPokemonSpecies>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Versions of the games, e.g., Red, Blue or Yellow.
public struct PKMVersion: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this version resource
    public let id: Int?
    
    /// The name for this version resource
    public let name: String?
    
    /// The name of this version listed in different languages
    public let names: [PKMName]?
    
    /// The version group this version belongs to
    public let versionGroup: PKMAPIResource<PKMVersionGroup>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version groups categorize highly similar versions of the games.
public struct PKMVersionGroup: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this version group resource
    public let id: Int?
    
    /// The name for this version group resource
    public let name: String?
    
    /// Order for sorting. Almost by date of release, except similar versions are grouped together.
    public let order: Int?
    
    /// The generation this version was introduced in
    public let generation: PKMAPIResource<PKMGeneration>?
    
    /// A list of methods in which Pokémon can learn moves in this version group
    public let moveLearnMethods: [PKMAPIResource<PKMMoveLearnMethod>]?
    
    /// The name of this version group listed in different languages
    public let names: [PKMName]?
    
    /// A list of Pokédexes introduces in this version group
    public let pokedexes: [PKMAPIResource<PKMPokedex>]?
    
    /// A list of regions that can be visited in this version group    list
    public let regions: [PKMAPIResource<PKMRegion>]?
    
    /// The versions this version group owns
    public let versions: [PKMAPIResource<PKMVersion>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
