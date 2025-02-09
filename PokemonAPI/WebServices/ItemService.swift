//
//  ItemService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMItemService: HTTPWebService {
    func fetchItemList(paginationState: PaginationState<PKMItem>) async throws -> PKMPagedObject<PKMItem>
    func fetchItem(_ itemID: Int) async throws -> PKMItem
    func fetchItem(_ itemName: String) async throws -> PKMItem
    func fetchItemAttributeList(paginationState: PaginationState<PKMItemAttribute>) async throws -> PKMPagedObject<PKMItemAttribute>
    func fetchItemAttribute(_ itemAttributeID: Int) async throws -> PKMItemAttribute
    func fetchItemAttribute(_ itemAttributeName: String) async throws -> PKMItemAttribute
    func fetchItemCategoryList(paginationState: PaginationState<PKMItemCategory>) async throws -> PKMPagedObject<PKMItemCategory>
    func fetchItemCategory(_ itemCategoryID: Int) async throws -> PKMItemCategory
    func fetchItemCategory(_ itemCategoryName: String) async throws -> PKMItemCategory
    func fetchItemFlingEffectList(paginationState: PaginationState<PKMItemFlingEffect>) async throws -> PKMPagedObject<PKMItemFlingEffect>
    func fetchItemFlingEffect(_ itemFlingEffectsID: Int) async throws -> PKMItemFlingEffect
    func fetchItemFlingEffect(_ itemFlingEffectsName: String) async throws -> PKMItemFlingEffect
    func fetchItemPocketList(paginationState: PaginationState<PKMItemPocket>) async throws -> PKMPagedObject<PKMItemPocket>
    func fetchItemPocket(_ itemPocketID: Int) async throws -> PKMItemPocket
    func fetchItemPocket(_ itemPocketName: String) async throws -> PKMItemPocket
}



// MARK: - Web Services

public struct ItemService: PKMItemService, Sendable {
    public enum API: APICall {
        case fetchItemList
        case fetchItemByID(Int)
        case fetchItemByName(String)
        case fetchItemAttributeList
        case fetchItemAttributeByID(Int)
        case fetchItemAttributeByName(String)
        case fetchItemCategoryList
        case fetchItemCategoryByID(Int)
        case fetchItemCategoryByName(String)
        case fetchItemFlingEffectList
        case fetchItemFlingEffectByID(Int)
        case fetchItemFlingEffectByName(String)
        case fetchItemPocketList
        case fetchItemPocketByID(Int)
        case fetchItemPocketByName(String)
        
        var path: String {
            switch self {
            case .fetchItemList:
                return "/item"
            case .fetchItemByID(let id):
                return "/item/\(id)"
            case .fetchItemByName(let name):
                return "/item/\(name)"
            case .fetchItemAttributeList:
                return "/item-attribute"
            case .fetchItemAttributeByID(let id):
                return "/item-attribute/\(id)"
            case .fetchItemAttributeByName(let name):
                return "/item-attribute/\(name)"
            case .fetchItemCategoryList:
                return "/item-category"
            case .fetchItemCategoryByID(let id):
                return "/item-category/\(id)"
            case .fetchItemCategoryByName(let name):
                return "/item-category/\(name)"
            case .fetchItemFlingEffectList:
                return "/item-fling-effect"
            case .fetchItemFlingEffectByID(let id):
                return "/item-fling-effect/\(id)"
            case .fetchItemFlingEffectByName(let name):
                return "/item-fling-effect/\(name)"
            case .fetchItemPocketList:
                return "/item-pocket"
            case .fetchItemPocketByID(let id):
                return "/item-pocket/\(id)"
            case .fetchItemPocketByName(let name):
                return "/item-pocket/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    /**
     Fetch Items list
     */
    public func fetchItemList(paginationState: PaginationState<PKMItem>) async throws -> PKMPagedObject<PKMItem> {
        try await callPaginated(endpoint: API.fetchItemList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemID: Item ID
     */
    public func fetchItem(_ itemID: Int) async throws -> PKMItem {
        try await PKMItem.decode(from: call(endpoint: API.fetchItemByID(itemID)))
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemName: Item Name
     */
    public func fetchItem(_ itemName: String) async throws -> PKMItem {
        try await PKMItem.decode(from: call(endpoint: API.fetchItemByName(itemName)))
    }
    
    
    /**
     Fetch Item Attributes list
     */
    public func fetchItemAttributeList(paginationState: PaginationState<PKMItemAttribute>) async throws -> PKMPagedObject<PKMItemAttribute> {
        try await callPaginated(endpoint: API.fetchItemAttributeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeID: Item Attribute ID
     */
    public func fetchItemAttribute(_ itemAttributeID: Int) async throws -> PKMItemAttribute {
        try await PKMItemAttribute.decode(from: call(endpoint: API.fetchItemAttributeByID(itemAttributeID)))
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeName: Item Attribute Name
     */
    public func fetchItemAttribute(_ itemAttributeName: String) async throws -> PKMItemAttribute {
        try await PKMItemAttribute.decode(from: call(endpoint: API.fetchItemAttributeByName(itemAttributeName)))
    }
    
    
    /**
     Fetch Item Categories list
     */
    public func fetchItemCategoryList(paginationState: PaginationState<PKMItemCategory>) async throws -> PKMPagedObject<PKMItemCategory> {
        try await callPaginated(endpoint: API.fetchItemCategoryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryID: Item Category ID
     */
    public func fetchItemCategory(_ itemCategoryID: Int) async throws -> PKMItemCategory {
        try await PKMItemCategory.decode(from: call(endpoint: API.fetchItemCategoryByID(itemCategoryID)))
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryName: Item Category Name
     */
    public func fetchItemCategory(_ itemCategoryName: String) async throws -> PKMItemCategory {
        try await PKMItemCategory.decode(from: call(endpoint: API.fetchItemCategoryByName(itemCategoryName)))
    }
    
    
    /**
     Fetch Item Fling Effects list
     */
    public func fetchItemFlingEffectList(paginationState: PaginationState<PKMItemFlingEffect>) async throws -> PKMPagedObject<PKMItemFlingEffect> {
        try await callPaginated(endpoint: API.fetchItemFlingEffectList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsID: Item Fling Effect ID
     */
    public func fetchItemFlingEffect(_ itemFlingEffectsID: Int) async throws -> PKMItemFlingEffect {
        try await PKMItemFlingEffect.decode(from: call(endpoint: API.fetchItemFlingEffectByID(itemFlingEffectsID)))
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsName: Item Fling Effect Name
     */
    public func fetchItemFlingEffect(_ itemFlingEffectsName: String) async throws -> PKMItemFlingEffect {
        try await PKMItemFlingEffect.decode(from: call(endpoint: API.fetchItemFlingEffectByName(itemFlingEffectsName)))
    }
    
    
    /**
     Fetch Item Pockets list
     */
    public func fetchItemPocketList(paginationState: PaginationState<PKMItemPocket>) async throws -> PKMPagedObject<PKMItemPocket> {
        try await callPaginated(endpoint: API.fetchItemPocketList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketID: Item Pocket ID
     */
    public func fetchItemPocket(_ itemPocketID: Int) async throws -> PKMItemPocket {
        try await PKMItemPocket.decode(from: call(endpoint: API.fetchItemPocketByID(itemPocketID)))
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketName: Item Pocket Name
     */
    public func fetchItemPocket(_ itemPocketName: String) async throws -> PKMItemPocket {
        try await PKMItemPocket.decode(from: call(endpoint: API.fetchItemPocketByName(itemPocketName)))
    }
}
