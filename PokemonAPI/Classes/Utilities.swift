//
//  Utilities.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/28/18.
//

import Foundation


// MARK: - Languages

/// Languages for translations of API resource information.
public struct PKMLanguage: Codable, Sendable {
    
    /// The identifier for this language resource
    public let id: Int?
    
    /// The name for this language resource
    public let name: String?
    
    /// Whether or not the games are published in this language
    public let official: Bool?
    
    /// The two-letter code of the country where this language is spoken. Note that it is not unique.
    public let iso639: String?
    
    /// The two-letter code of the language. Note that it is not unique.
    public let iso3166: String?
    
    /// The name of this language listed in different languages
    public let names: [PKMName]?
}



// MARK - Common Models

/// Description
public struct PKMDescription: Codable, Sendable {
    
    /// The localized description for an API resource in a specific language
    public let description: String?
    
    /// The language this name is in
    public let language: PKMAPIResource<PKMLanguage>?
}


/// Effect
public struct PKMEffect: Codable, Sendable {
    
    /// The localized effect text for an API resource in a specific language
    public let effect: String?
    
    /// The language this effect is in
    public let language: PKMAPIResource<PKMLanguage>?
}


/// Encounter
public struct PKMEncounter: Codable, SelfDecodable, Sendable {
    
    /// The lowest level the Pokémon could be encountered at
    public let minLevel: Int?
    
    /// The highest level the Pokémon could be encountered at
    public let maxLevel: Int?
    
    /// A list of condition values that must be in effect for this encounter to occur
    public let conditionValues: [PKMAPIResource<PKMEncounterConditionValue>]?
    
    /// percent chance that this encounter will occur
    public let chance: Int?
    
    /// The method by which this encounter happens
    public let method: PKMAPIResource<PKMEncounterMethod>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Flavor Text
public struct PKMFlavorText: Codable, SelfDecodable, Sendable {
    
    /// The localized flavor text for an API resource in a specific language. Note that this text is left unprocessed as it is found in game files. This means that it contains special characters that one might want to replace with their visible decodable version.
    public let flavorText: String?
    
    /// The language this name is in
    public let language: PKMAPIResource<PKMLanguage>?
    
    /// The game version this flavor text is extracted from.
    public let version: PKMAPIResource<PKMVersion>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Generation Game Index
public struct PKMGenerationGameIndex: Codable, SelfDecodable, Sendable {
    
    /// The internal id of an API resource within game data
    public let gameIndex: Int?
    
    /// The generation relevent to this game index
    public let generation: PKMAPIResource<PKMGeneration>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Machine Version Detail
public struct PKMMachineVersionDetail: Codable, SelfDecodable, Sendable {
    
    /// The machine that teaches a move from an item
    public let machine: PKMAPIResource<PKMMachine>?
    
    /// The version group of this specific machine
    public let versionGroup: PKMAPIResource<PKMVersion>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Name
public struct PKMName: Codable, Sendable {
    
    /// The localized name for an API resource in a specific language
    public let name: String?
    
    /// The language this name is in
    public let language: PKMAPIResource<PKMLanguage>?
}


/// Verbose Effect
public struct PKMVerboseEffect: Codable, SelfDecodable, Sendable {
    
    /// The localized effect text for an API resource in a specific language
    public let effect: String?
    
    /// The localized effect text in brief
    public let shortEffect: String?
    
    /// The language this effect is in
    public let language: PKMAPIResource<PKMLanguage>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version Encounter Detail
public struct PKMVersionEncounterDetail: Codable, SelfDecodable, Sendable {
    
    /// The game version this encounter happens in
    public let version: PKMAPIResource<PKMVersion>?
    
    /// The total percentage of all encounter potential
    public let maxChance: Int?
    
    /// A list of encounters and their specifics
    public let encounterDetails: [PKMEncounter]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version Game Index
public struct PKMVersionGameIndex: Codable, SelfDecodable, Sendable {
    
    /// The internal id of an API resource within game data
    public let gameIndex: Int?
    
    /// The version relevent to this game index
    public let version: PKMAPIResource<PKMVersion>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version Group Flavor Text
public struct PKMVersionGroupFlavorText: Codable, SelfDecodable, Sendable {
    
    /// The localized name for an API resource in a specific language
    public let text: String?
    
    /// The language this name is in
    public let language: PKMAPIResource<PKMLanguage>?
    
    /// The version group which uses this flavor text
    public let versionGroup: PKMAPIResource<PKMVersion>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
