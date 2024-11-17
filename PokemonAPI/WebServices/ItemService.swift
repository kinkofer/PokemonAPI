//
//  ItemService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMItemService: HTTPWebService {
    func fetchItemList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItem
    func fetchItem(_ itemID: Int, completion: @escaping (_ result: Result<PKMItem, Error>) -> Void)
    func fetchItem(_ itemName: String, completion: @escaping (_ result: Result<PKMItem, Error>) -> Void)
    func fetchItemAttributeList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItemAttribute
    func fetchItemAttribute(_ itemAttributeID: Int, completion: @escaping (_ result: Result<PKMItemAttribute, Error>) -> Void)
    func fetchItemAttribute(_ itemAttributeName: String, completion: @escaping (_ result: Result<PKMItemAttribute, Error>) -> Void)
    func fetchItemCategoryList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItemCategory
    func fetchItemCategory(_ itemCategoryID: Int, completion: @escaping (_ result: Result<PKMItemCategory, Error>) -> Void)
    func fetchItemCategory(_ itemCategoryName: String, completion: @escaping (_ result: Result<PKMItemCategory, Error>) -> Void)
    func fetchItemFlingEffectList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void)  where T: PKMItemFlingEffect
    func fetchItemFlingEffect(_ itemFlingEffectsID: Int, completion: @escaping (_ result: Result<PKMItemFlingEffect, Error>) -> Void)
    func fetchItemFlingEffect(_ itemFlingEffectsName: String, completion: @escaping (_ result: Result<PKMItemFlingEffect, Error>) -> Void)
    func fetchItemPocketList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItemPocket
    func fetchItemPocket(_ itemPocketID: Int, completion: @escaping (_ result: Result<PKMItemPocket, Error>) -> Void)
    func fetchItemPocket(_ itemPocketName: String, completion: @escaping (_ result: Result<PKMItemPocket, Error>) -> Void)
    
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItem
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItem(_ itemID: Int) async throws -> PKMItem
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItem(_ itemName: String) async throws -> PKMItem
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemAttributeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItemAttribute
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemAttribute(_ itemAttributeID: Int) async throws -> PKMItemAttribute
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemAttribute(_ itemAttributeName: String) async throws -> PKMItemAttribute
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemCategoryList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItemCategory
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemCategory(_ itemCategoryID: Int) async throws -> PKMItemCategory
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemCategory(_ itemCategoryName: String) async throws -> PKMItemCategory
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemFlingEffectList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T>  where T: PKMItemFlingEffect
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemFlingEffect(_ itemFlingEffectsID: Int) async throws -> PKMItemFlingEffect
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemFlingEffect(_ itemFlingEffectsName: String) async throws -> PKMItemFlingEffect
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemPocketList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItemPocket
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemPocket(_ itemPocketID: Int) async throws -> PKMItemPocket
    @available(macOS 12, iOS 15, tvOS 15.0, watchOS 8.0, *)
    func fetchItemPocket(_ itemPocketName: String) async throws -> PKMItemPocket
}



// MARK: - Web Services

public struct ItemService: PKMItemService {
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
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Items list
     */
    public func fetchItemList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItem {
        callPaginated(endpoint: API.fetchItemList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemID: Item ID
     */
    public func fetchItem(_ itemID: Int, completion: @escaping (_ result: Result<PKMItem, Error>) -> Void) {
        call(endpoint: API.fetchItemByID(itemID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemName: Item Name
     */
    public func fetchItem(_ itemName: String, completion: @escaping (_ result: Result<PKMItem, Error>) -> Void) {
        call(endpoint: API.fetchItemByName(itemName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Attributes list
     */
    public func fetchItemAttributeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItemAttribute {
        callPaginated(endpoint: API.fetchItemAttributeList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeID: Item Attribute ID
     */
    public func fetchItemAttribute(_ itemAttributeID: Int, completion: @escaping (_ result: Result<PKMItemAttribute, Error>) -> Void) {
        call(endpoint: API.fetchItemAttributeByID(itemAttributeID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeName: Item Attribute Name
     */
    public func fetchItemAttribute(_ itemAttributeName: String, completion: @escaping (_ result: Result<PKMItemAttribute, Error>) -> Void) {
        call(endpoint: API.fetchItemAttributeByName(itemAttributeName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Categories list
     */
    public func fetchItemCategoryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItemCategory {
        callPaginated(endpoint: API.fetchItemCategoryList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryID: Item Category ID
     */
    public func fetchItemCategory(_ itemCategoryID: Int, completion: @escaping (_ result: Result<PKMItemCategory, Error>) -> Void) {
        call(endpoint: API.fetchItemCategoryByID(itemCategoryID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryName: Item Category Name
     */
    public func fetchItemCategory(_ itemCategoryName: String, completion: @escaping (_ result: Result<PKMItemCategory, Error>) -> Void) {
        call(endpoint: API.fetchItemCategoryByName(itemCategoryName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Fling Effects list
     */
    public func fetchItemFlingEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void)  where T: PKMItemFlingEffect {
        callPaginated(endpoint: API.fetchItemFlingEffectList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsID: Item Fling Effect ID
     */
    public func fetchItemFlingEffect(_ itemFlingEffectsID: Int, completion: @escaping (_ result: Result<PKMItemFlingEffect, Error>) -> Void) {
        call(endpoint: API.fetchItemFlingEffectByID(itemFlingEffectsID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsName: Item Fling Effect Name
     */
    public func fetchItemFlingEffect(_ itemFlingEffectsName: String, completion: @escaping (_ result: Result<PKMItemFlingEffect, Error>) -> Void) {
        call(endpoint: API.fetchItemFlingEffectByName(itemFlingEffectsName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Pockets list
     */
    public func fetchItemPocketList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMItemPocket {
        callPaginated(endpoint: API.fetchItemPocketList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketID: Item Pocket ID
     */
    public func fetchItemPocket(_ itemPocketID: Int, completion: @escaping (_ result: Result<PKMItemPocket, Error>) -> Void) {
        call(endpoint: API.fetchItemPocketByID(itemPocketID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketName: Item Pocket Name
     */
    public func fetchItemPocket(_ itemPocketName: String, completion: @escaping (_ result: Result<PKMItemPocket, Error>) -> Void) {
        call(endpoint: API.fetchItemPocketByName(itemPocketName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Async Services

extension ItemService {
    /**
     Fetch Items list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItem {
        try await callPaginated(endpoint: API.fetchItemList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemID: Item ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItem(_ itemID: Int) async throws -> PKMItem {
        try await PKMItem.decode(from: call(endpoint: API.fetchItemByID(itemID)))
    }
    
    
    /**
     Fetch Item Information
     
     - parameter itemName: Item Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItem(_ itemName: String) async throws -> PKMItem {
        try await PKMItem.decode(from: call(endpoint: API.fetchItemByName(itemName)))
    }
    
    
    /**
     Fetch Item Attributes list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemAttributeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItemAttribute {
        try await callPaginated(endpoint: API.fetchItemAttributeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeID: Item Attribute ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemAttribute(_ itemAttributeID: Int) async throws -> PKMItemAttribute {
        try await PKMItemAttribute.decode(from: call(endpoint: API.fetchItemAttributeByID(itemAttributeID)))
    }
    
    
    /**
     Fetch Item Attribute Information
     
     - parameter itemAttributeName: Item Attribute Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemAttribute(_ itemAttributeName: String) async throws -> PKMItemAttribute {
        try await PKMItemAttribute.decode(from: call(endpoint: API.fetchItemAttributeByName(itemAttributeName)))
    }
    
    
    /**
     Fetch Item Categories list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemCategoryList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItemCategory {
        try await callPaginated(endpoint: API.fetchItemCategoryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryID: Item Category ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemCategory(_ itemCategoryID: Int) async throws -> PKMItemCategory {
        try await PKMItemCategory.decode(from: call(endpoint: API.fetchItemCategoryByID(itemCategoryID)))
    }
    
    
    /**
     Fetch Item Category Information
     
     - parameter itemCategoryName: Item Category Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemCategory(_ itemCategoryName: String) async throws -> PKMItemCategory {
        try await PKMItemCategory.decode(from: call(endpoint: API.fetchItemCategoryByName(itemCategoryName)))
    }
    
    
    /**
     Fetch Item Fling Effects list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemFlingEffectList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T>  where T: PKMItemFlingEffect {
        try await callPaginated(endpoint: API.fetchItemFlingEffectList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsID: Item Fling Effect ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemFlingEffect(_ itemFlingEffectsID: Int) async throws -> PKMItemFlingEffect {
        try await PKMItemFlingEffect.decode(from: call(endpoint: API.fetchItemFlingEffectByID(itemFlingEffectsID)))
    }
    
    
    /**
     Fetch Item Fling Effect Information
     
     - parameter itemFlingEffectsName: Item Fling Effect Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemFlingEffect(_ itemFlingEffectsName: String) async throws -> PKMItemFlingEffect {
        try await PKMItemFlingEffect.decode(from: call(endpoint: API.fetchItemFlingEffectByName(itemFlingEffectsName)))
    }
    
    
    /**
     Fetch Item Pockets list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemPocketList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMItemPocket {
        try await callPaginated(endpoint: API.fetchItemPocketList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketID: Item Pocket ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemPocket(_ itemPocketID: Int) async throws -> PKMItemPocket {
        try await PKMItemPocket.decode(from: call(endpoint: API.fetchItemPocketByID(itemPocketID)))
    }
    
    
    /**
     Fetch Item Pocket Information
     
     - parameter itemPocketName: Item Pocket Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchItemPocket(_ itemPocketName: String) async throws -> PKMItemPocket {
        try await PKMItemPocket.decode(from: call(endpoint: API.fetchItemPocketByName(itemPocketName)))
    }
}
