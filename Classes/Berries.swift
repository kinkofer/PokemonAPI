//
//  Berries.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/26/18.
//

import Foundation


/// Berries are small fruits that can provide HP and status condition restoration, stat enhancement, and even damage negation when eaten by Pokémon. Check out Bulbapedia for greater detail.
open class PKMBerry: Codable, SelfDecodable {
    
    /// The identifier for this berry resource
    open var id: Int?
    
    /// The name for this berry resource
    open var name: String?
    
    /// Time it takes the tree to grow one stage, in hours. Berry trees go through four of these growth stages before they can be picked.
    open var growthTime: Int?
    
    /// The maximum number of these berries that can grow on one tree in Generation IV
    open var maxHarvest: Int?
    
    /// The power of the move "Natural Gift" when used with this Berry
    open var naturalGiftPower: Int?
    
    /// The size of this Berry, in millimeters
    open var size: Int?
    
    /// The smoothness of this Berry, used in making Pokéblocks or Poffins
    open var smoothness: Int?
    
    /// The speed at which this Berry dries out the soil as it grows. A higher rate means the soil dries more quickly.
    open var soilDryness: Int?
    
    /// The firmness of this berry, used in making Pokéblocks or Poffins
    open var firmness: PKMNamedAPIResource<PKMBerryFirmness>?
    
    /// A list of references to each flavor a berry can have and the potency of each of those flavors in regard to this berry
    open var flavors: [PKMBerryFlavorMap]?
    
    /// Berries are actually items. This is a reference to the item specific data for this berry.
    open var item: PKMNamedAPIResource<PKMItem>?
    
    /// The Type the move "Natural Gift" has when used with this Berry
    open var naturalGiftType: PKMNamedAPIResource<PKMType>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Berry Flavor Map
open class PKMBerryFlavorMap: Codable {
    
    /// How powerful the referenced flavor is for this berry
    open var potency: Int?
    
    /// The berry with the referenced flavor
    open var flavor: PKMNamedAPIResource<PKMBerryFlavor>?
}


/// Berry Firmness
open class PKMBerryFirmness: Codable {
    
    /// The identifier for this berry firmness resource
    open var id: Int?
    
    /// The name of this berry firmness listed in different languages
    open var berries: [PKMNamedAPIResource<PKMBerry>]?
    
    /// A list of the berries with this firmness
    open var names: [PKMName]?
    
    /// The name for this berry firmness resource
    open var name: String?
}


/// Flavors determine whether a Pokémon will benefit or suffer from eating a berry based on their nature. Check out Bulbapedia for greater detail.
open class PKMBerryFlavor: Codable, SelfDecodable {
    
    /// The identifier for this berry flavor resource
    open var id: Int?
    
    /// The name for this berry flavor resource
    open var name: String?
    
    /// A list of the berries with this flavor
    open var berries: [PKMFlavorBerryMap]?
    
    /// The contest type that correlates with this berry flavor
    open var contestType: PKMNamedAPIResource<PKMContestType>?
    
    /// The name of this berry flavor listed in different languages
    open var names: [PKMName]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Flavor Berry Map
open class PKMFlavorBerryMap: Codable {
    
    /// How powerful the referenced flavor is for this berry
    open var potency: Int?
    
    /// The berry with the referenced flavor
    open var berry: PKMNamedAPIResource<PKMBerry>?
}
