//
//  Items.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


/// An item is an object in the games which the player can pick up, keep in their bag, and use in some manner. They have various uses, including healing, powering up, helping catch Pokémon, or to access a new area.
open class PKMItem: Codable, SelfDecodable {
    
    /// The identifier for this item resource
    open var id: Int?
    
    /// The name for this item resource
    open var name: String?
    
    /// The price of this item in stores
    open var cost: Int?
    
    /// The power of the move Fling when used with this item.
    open var flingPower: Int?
    
    /// The effect of the move Fling when used with this item
    open var flingEffect: PKMNamedAPIResource<PKMItemFlingEffect>?
    
    /// A list of attributes this item has
    open var attributes: [PKMNamedAPIResource<PKMItemAttribute>]?
    
    /// The category of items this item falls into
    open var category: PKMItemCategory?
    
    /// The effect of this ability listed in different languages
    open var effectEntries: [PKMVerboseEffect]?
    
    /// The flavor text of this ability listed in different languages
    open var flavorTextEntries: [PKMVersionGroupFlavorText]?
    
    /// A list of game indices relevent to this item by generation
    open var gameIndices: [PKMGenerationGameIndex]?
    
    /// The name of this item listed in different languages
    open var names: [PKMName]?
    
    /// A set of sprites used to depict this item in the game
    open var sprites: PKMItemSprites?
    
    /// A list of Pokémon that might be found in the wild holding this item
    open var heldByPokemon: [PKMItemHolderPokemon]?
    
    /// An evolution chain this item requires to produce a bay during mating
    open var babyTriggerFor: PKMAPIResource<PKMEvolutionChain>?
    
    /// A list of the machines related to this item
    open var machines: [PKMMachineVersionDetail]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Item Sprites
open class PKMItemSprites: Codable {
    /// The default depiction of this item
    open var `default`: String?
}


/// Item Holder Pokemon
open class PKMItemHolderPokemon: Codable, SelfDecodable {
    
    /// The Pokémon that holds this item
    open var pokemon: String?
    
    /// The details for the version that this item is held in by the Pokémon
    open var versionDetails: [PKMItemHolderPokemonVersionDetail]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Item Holder Pokemon Version Detail
open class PKMItemHolderPokemonVersionDetail: Codable {
    
    /// How often this Pokémon holds this item in this version
    open var rarity: String?
    
    /// The version that this item is held in by the Pokémon
    open var version: PKMNamedAPIResource<PKMVersion>?
}


/// Item attributes define particular aspects of items, e.g. "usable in battle" or "consumable".
open class PKMItemAttribute: Codable {
    
    /// The identifier for this item attribute resource
    open var id: Int?
    
    /// The name for this item attribute resource
    open var name: String?
    
    /// A list of items that have this attribute
    open var items: [PKMNamedAPIResource<PKMItem>]?
    
    /// The name of this item attribute listed in different languages
    open var names: [PKMName]?
    
    /// The description of this item attribute listed in different languages
    open var descriptions: [PKMDescription]?
}


/// Item categories determine where items will be placed in the players bag.
open class PKMItemCategory: Codable {
    
    /// The identifier for this item category resource
    open var id: Int?
    
    /// The name for this item category resource
    open var name: String?
    
    /// A list of items that are a part of this category
    open var items: [PKMNamedAPIResource<PKMItem>]?
    
    /// The name of this item category listed in different languages
    open var names: [PKMName]?
    
    /// The pocket items in this category would be put in
    open var pocket: PKMNamedAPIResource<PKMItemPocket>?
}


/// The various effects of the move "Fling" when used with different items.
open class PKMItemFlingEffect: Codable, SelfDecodable {
    
    /// The identifier for this fling effect resource
    open var id: Int?
    
    /// The name for this fling effect resource
    open var name: String?
    
    /// The result of this fling effect listed in different languages
    open var effectEntries: [PKMEffect]?
    
    /// A list of items that have this fling effect    list
    open var items: [PKMNamedAPIResource<PKMItem>]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}


/// Pockets within the players bag used for storing items by category.
open class PKMItemPocket: Codable {
    
    /// The identifier for this item pocket resource
    open var id: Int?
    
    /// The name for this item pocket resource
    open var name: String?
    
    /// A list of item categories that are relevent to this item pocket
    open var categories: [PKMNamedAPIResource<PKMItemCategory>]?
    
    /// The name of this item pocket listed in different languages
    open var names: [PKMName]?
}



// MARK: - Web Services

open class ItemService {
    /**
     Fetch Items list
     */
    public static func fetchItemList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMItem {
        let urlStr = baseURL + "/item"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemId: Item ID
     */
    public static func fetchItem(_ itemId: Int, completion: @escaping (_ result: Result<PKMItem, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item/\(itemId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemName: Item Name
     */
    public static func fetchItem(_ itemName: String, completion: @escaping (_ result: Result<PKMItem, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item/\(itemName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Attributes list
     */
    public static func fetchItemAttributeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMItemAttribute {
        let urlStr = baseURL + "/item-attribute"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeId: Item Attribute ID
     */
    public static func fetchItemAttribute(_ itemAttributeId: Int, completion: @escaping (_ result: Result<PKMItemAttribute, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-attribute/\(itemAttributeId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeName: Item Attribute Name
     */
    public static func fetchItemAttribute(_ itemAttributeName: String, completion: @escaping (_ result: Result<PKMItemAttribute, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-attribute/\(itemAttributeName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Categories list
     */
    public static func fetchItemCategoryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMItemCategory {
        let urlStr = baseURL + "/item-category"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryId: Item Category ID
     */
    public static func fetchItemCategory(_ itemCategoryId: Int, completion: @escaping (_ result: Result<PKMItemCategory, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-category/\(itemCategoryId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryName: Item Category Name
     */
    public static func fetchItemCategory(_ itemCategoryName: String, completion: @escaping (_ result: Result<PKMItemCategory, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-category/\(itemCategoryName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Fling Effects list
     */
    public static func fetchItemFlingEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void)  where T: PKMItemFlingEffect {
        let urlStr = baseURL + "/item-fling-effect"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsId: Item Fling Effect ID
     */
    public static func fetchItemFlingEffect(_ itemFlingEffectsId: Int, completion: @escaping (_ result: Result<PKMItemFlingEffect, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-fling-effect/\(itemFlingEffectsId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsName: Item Fling Effect Name
     */
    public static func fetchItemFlingEffect(_ itemFlingEffectsName: String, completion: @escaping (_ result: Result<PKMItemFlingEffect, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-fling-effect/\(itemFlingEffectsName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Pockets list
     */
    public static func fetchItemPocketList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMItemPocket {
        let urlStr = baseURL + "/item-pocket"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketId: Item Pocket ID
     */
    public static func fetchItemPocket(_ itemPocketId: Int, completion: @escaping (_ result: Result<PKMItemPocket, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-pocket/\(itemPocketId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketName: Item Pocket Name
     */
    public static func fetchItemPocket(_ itemPocketName: String, completion: @escaping (_ result: Result<PKMItemPocket, HTTPError>) -> Void) {
        let urlStr = baseURL + "/item-pocket/\(itemPocketName)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
