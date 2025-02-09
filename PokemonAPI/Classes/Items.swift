//
//  Items.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// An item is an object in the games which the player can pick up, keep in their bag, and use in some manner. They have various uses, including healing, powering up, helping catch Pokémon, or to access a new area.
public struct PKMItem: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this item resource
    public let id: Int?
    
    /// The name for this item resource
    public let name: String?
    
    /// The price of this item in stores
    public let cost: Int?
    
    /// The power of the move Fling when used with this item.
    public let flingPower: Int?
    
    /// The effect of the move Fling when used with this item
    public let flingEffect: PKMAPIResource<PKMItemFlingEffect>?
    
    /// A list of attributes this item has
    public let attributes: [PKMAPIResource<PKMItemAttribute>]?
    
    /// The category of items this item falls into
    public let category: PKMItemCategory?
    
    /// The effect of this ability listed in different languages
    public let effectEntries: [PKMVerboseEffect]?
    
    /// The flavor text of this ability listed in different languages
    public let flavorTextEntries: [PKMVersionGroupFlavorText]?
    
    /// A list of game indices relevent to this item by generation
    public let gameIndices: [PKMGenerationGameIndex]?
    
    /// The name of this item listed in different languages
    public let names: [PKMName]?
    
    /// A set of sprites used to depict this item in the game
    public let sprites: PKMItemSprites?
    
    /// A list of Pokémon that might be found in the wild holding this item
    public let heldByPokemon: [PKMItemHolderPokemon]?
    
    /// An evolution chain this item requires to produce a bay during mating
    public let babyTriggerFor: PKMAPIResource<PKMEvolutionChain>?
    
    /// A list of the machines related to this item
    public let machines: [PKMMachineVersionDetail]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Item Sprites
public struct PKMItemSprites: Codable, Sendable {
    /// The default depiction of this item
    public let `default`: String?
}


/// Item Holder Pokemon
public struct PKMItemHolderPokemon: Codable, SelfDecodable, Sendable {
    
    /// The Pokémon that holds this item
    public let pokemon: String?
    
    /// The details for the version that this item is held in by the Pokémon
    public let versionDetails: [PKMItemHolderPokemonVersionDetail]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Item Holder Pokemon Version Detail
public struct PKMItemHolderPokemonVersionDetail: Codable, Sendable {
    
    /// How often this Pokémon holds this item in this version
    public let rarity: Int?
    
    /// The version that this item is held in by the Pokémon
    public let version: PKMAPIResource<PKMVersion>?
}


/// Item attributes define particular aspects of items, e.g. "usable in battle" or "consumable".
public struct PKMItemAttribute: Codable, Sendable {
    
    /// The identifier for this item attribute resource
    public let id: Int?
    
    /// The name for this item attribute resource
    public let name: String?
    
    /// A list of items that have this attribute
    public let items: [PKMAPIResource<PKMItem>]?
    
    /// The name of this item attribute listed in different languages
    public let names: [PKMName]?
    
    /// The description of this item attribute listed in different languages
    public let descriptions: [PKMDescription]?
}


/// Item categories determine where items will be placed in the players bag.
public struct PKMItemCategory: Codable, Sendable {
    
    /// The identifier for this item category resource
    public let id: Int?
    
    /// The name for this item category resource
    public let name: String?
    
    /// A list of items that are a part of this category
    public let items: [PKMAPIResource<PKMItem>]?
    
    /// The name of this item category listed in different languages
    public let names: [PKMName]?
    
    /// The pocket items in this category would be put in
    public let pocket: PKMAPIResource<PKMItemPocket>?
}


/// The various effects of the move "Fling" when used with different items.
public struct PKMItemFlingEffect: Codable, SelfDecodable, Sendable {
    
    /// The identifier for this fling effect resource
    public let id: Int?
    
    /// The name for this fling effect resource
    public let name: String?
    
    /// The result of this fling effect listed in different languages
    public let effectEntries: [PKMEffect]?
    
    /// A list of items that have this fling effect    list
    public let items: [PKMAPIResource<PKMItem>]?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pockets within the players bag used for storing items by category.
public struct PKMItemPocket: Codable, Sendable {
    
    /// The identifier for this item pocket resource
    public let id: Int?
    
    /// The name for this item pocket resource
    public let name: String?
    
    /// A list of item categories that are relevent to this item pocket
    public let categories: [PKMAPIResource<PKMItemCategory>]?
    
    /// The name of this item pocket listed in different languages
    public let names: [PKMName]?
}
