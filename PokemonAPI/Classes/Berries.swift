//
//  Berries.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/26/18.
//

import Foundation


/// Berries are small fruits that can provide HP and status condition restoration, stat enhancement, and even damage negation when eaten by Pokémon. Check out Bulbapedia for greater detail.
public struct PKMBerry: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this berry resource
    public let id: Int?
    
    /// The name for this berry resource
    public let name: String?
    
    /// Time it takes the tree to grow one stage, in hours. Berry trees go through four of these growth stages before they can be picked.
    public let growthTime: Int?
    
    /// The maximum number of these berries that can grow on one tree in Generation IV
    public let maxHarvest: Int?
    
    /// The power of the move "Natural Gift" when used with this Berry
    public let naturalGiftPower: Int?
    
    /// The size of this Berry, in millimeters
    public let size: Int?
    
    /// The smoothness of this Berry, used in making Pokéblocks or Poffins
    public let smoothness: Int?
    
    /// The speed at which this Berry dries out the soil as it grows. A higher rate means the soil dries more quickly.
    public let soilDryness: Int?
    
    /// The firmness of this berry, used in making Pokéblocks or Poffins
    public let firmness: PKMAPIResource<PKMBerryFirmness>?
    
    /// A list of references to each flavor a berry can have and the potency of each of those flavors in regard to this berry
    public let flavors: [PKMBerryFlavorMap]?
    
    /// Berries are actually items. This is a reference to the item-specific data for this berry.
    public let item: PKMAPIResource<PKMItem>?
    
    /// The Type the move "Natural Gift" has when used with this Berry
    public let naturalGiftType: PKMAPIResource<PKMType>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Berry Flavor Map
public struct PKMBerryFlavorMap: Codable, Sendable {
    
    /// How powerful the referenced flavor is for this berry
    public let potency: Int?
    
    /// The berry with the referenced flavor
    public let flavor: PKMAPIResource<PKMBerryFlavor>?
}


/// Berry Firmness
public struct PKMBerryFirmness: Codable, Sendable {
    
    /// The identifier for this berry firmness resource
    public let id: Int?
    
    /// The name of this berry firmness listed in different languages
    public let berries: [PKMAPIResource<PKMBerry>]?
    
    /// A list of the berries with this firmness
    public let names: [PKMName]?
    
    /// The name for this berry firmness resource
    public let name: String?
}


/// Flavors determine whether a Pokémon will benefit or suffer from eating a berry based on their nature. Check out Bulbapedia for greater detail.
public struct PKMBerryFlavor: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this berry flavor resource
    public let id: Int?
    
    /// The name for this berry flavor resource
    public let name: String?
    
    /// A list of the berries with this flavor
    public let berries: [PKMFlavorBerryMap]?
    
    /// The contest type that correlates with this berry flavor
    public let contestType: PKMAPIResource<PKMContestType>?
    
    /// The name of this berry flavor listed in different languages
    public let names: [PKMName]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Flavor Berry Map
public struct PKMFlavorBerryMap: Codable, Sendable {
    
    /// How powerful the referenced flavor is for this berry
    public let potency: Int?
    
    /// The berry with the referenced flavor
    public let berry: PKMAPIResource<PKMBerry>?
}
