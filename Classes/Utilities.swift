//
//  Utilities.swift
//  PokemonKit
//
//  Created by Christopher Jennewein on 6/28/18.
//

import Foundation


// MARK: - Languages

/// Languages for translations of API resource information.
open class PKMLanguage: Codable {
    
    /// The identifier for this language resource
    open var id: Int?
    
    /// The name for this language resource
    open var name: String?
    
    /// Whether or not the games are published in this language
    open var official: Bool?
    
    /// The two-letter code of the country where this language is spoken. Note that it is not unique.
    open var iso639: String?
    
    /// The two-letter code of the language. Note that it is not unique.
    open var iso3166: String?
    
    /// The name of this language listed in different languages
    open var names: [PKMName]?
}



// MARK - Common Models

/// API Referenced Resource
open class PKMAPIResource: Codable {
    /// The URL of the referenced resource
    open var url: String?
}


/// Description
open class PKMDescription: Codable {
    
    /// The localized description for an API resource in a specific language
    open var description: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource?
}


/// Effect
open class PKMEffect: Codable {
    
    /// The localized effect text for an API resource in a specific language
    open var effect: String?
    
    /// The language this effect is in
    open var language: PKMNamedAPIResource?
}


/// Encounter
open class PKMEncounter: Codable, SelfDecodable {
    
    /// The lowest level the Pokémon could be encountered at
    open var minLevel: Int?
    
    /// The highest level the Pokémon could be encountered at
    open var maxLevel: Int?
    
    /// A list of condition values that must be in effect for this encounter to occur
    open var conditionValues: [PKMNamedAPIResource]?
    
    /// percent chance that this encounter will occur
    open var chance: Int?
    
    /// The method by which this encounter happens
    open var method: PKMNamedAPIResource?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Flavor Text
open class PKMFlavorText: Codable, SelfDecodable {
    
    /// The localized flavor text for an API resource in a specific language
    open var flavorText: String?
    
    /// The language this name is in
    open var language: PKMName?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Generation Game Index
open class PKMGenerationGameIndex: Codable, SelfDecodable {
    
    /// The internal id of an API resource within game data
    open var gameIndex: Int?
    
    /// The generation relevent to this game index
    open var generation: PKMNamedAPIResource?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Machine Version Detail
open class PKMMachineVersionDetail: Codable, SelfDecodable {
    
    /// The machine that teaches a move from an item
    open var machine: PKMAPIResource?
    
    /// The version group of this specific machine
    open var versionGroup: PKMNamedAPIResource?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Name
open class PKMName: Codable {
    
    /// The localized name for an API resource in a specific language
    open var name: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource?
}


/// Named API Resource
open class PKMNamedAPIResource: Codable {
    
    /// The name of the referenced resource
    open var name: String?
    
    /// The URL of the referenced resource
    open var url: String?
}


/// Paged Object
open class PKMPagedObject: Codable {
    
    /// The total number of resources abailable from this API
    open var count: Int?
    
    /// The url for the next 'page' in the list
    open var next: String?
    
    /// The url for the previous page in the list
    open var previous: String?
    
    /// List of unnamed API resources
    open var results: [PKMNamedAPIResource]?
}


/// Verbose Effect
open class PKMVerboseEffect: Codable, SelfDecodable {
    
    /// The localized effect text for an API resource in a specific language
    open var effect: String?
    
    /// The localized effect text in brief
    open var shortEffect: String?
    
    /// The language this effect is in
    open var language: PKMNamedAPIResource?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version Encounter Detail
open class PKMVersionEncounterDetail: Codable, SelfDecodable {
    
    /// The game version this encounter happens in
    open var version: PKMNamedAPIResource?
    
    /// The total percentage of all encounter potential
    open var maxChance: Int?
    
    /// A list of encounters and their specifics
    open var encounterDetails: [PKMEncounter]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version Game Index
open class PKMVersionGameIndex: Codable, SelfDecodable {
    
    /// The internal id of an API resource within game data
    open var gameIndex: Int?
    
    /// The version relevent to this game index
    open var version: PKMNamedAPIResource?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Version Group Flavor Text
open class PKMVersionGroupFlavorText: Codable, SelfDecodable {
    
    /// The localized name for an API resource in a specific language
    open var text: String?
    
    /// The language this name is in
    open var language: PKMNamedAPIResource?
    
    /// The version group which uses this flavor text
    open var versionGroup: PKMNamedAPIResource?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Web Services

open class UtilityService {
    /**
     Fetch Languages list
     */
    public func fetchLanguages(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
        let urlStr = baseURL + "/language"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Language Information
     
     - parameter languageId: Language ID
     */
    public func fetchLanguage(_ languageId: String, completion: @escaping (_ result: Result<PKMLanguage>) -> Void) {
        let urlStr = baseURL + "/language/" + languageId
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
