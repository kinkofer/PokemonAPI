//
//  Contests.swift
//  Pods-PokemonAPI-Example
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// Contest types are categories judges used to weigh a Pokémon's condition in Pokémon contests. Check out Bulbapedia for greater detail.
public struct PKMContestType: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this contest type resource
    public let id: Int?
    
    /// The name for this contest type resource
    public let name: String?
    
    /// The berry flavor that correlates with this contest type
    public let berryFlavor: PKMAPIResource<PKMBerryFlavor>?
    
    /// The name of this contest type listed in different languages
    public let names: [PKMContestName]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Contest Name
public struct PKMContestName: Codable, Sendable {
    
    /// The localized name for an API resource in a specific language
    public let name: String?
    
    /// The color associated with this contest's name
    public let color: String?
    
    /// The language this name is in
    public let language: PKMAPIResource<PKMLanguage>?
}


/// Contest effects refer to the effects of moves when used in contests.
public struct PKMContestEffect: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this contest type resource
    public let id: Int?
    
    /// The base number of hearts the user of this move gets
    public let appeal: String?
    
    /// The base number of hearts the user's opponent loses
    public let jam: Int?
    
    /// The result of this contest effect listed in different languages
    public let effectEntries: [PKMEffect]?
    
    /// The flavor text of this contest effect listed in different languages
    public let flavorTextEntries: [PKMFlavorText]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Super contest effects refer to the effects of moves when used in super contests.
public struct PKMSuperContestEffect: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this super contest effect resource
    public let id: Int?
    
    /// The level of appeal this super contest effect has
    public let appeal: String?
    
    /// The flavor text of this super contest effect listed in different languages
    public let flavorTextEntries: [PKMFlavorText]?
    
    /// A list of moves that have the effect when used in super contests
    public let moves: [PKMAPIResource<PKMMove>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
