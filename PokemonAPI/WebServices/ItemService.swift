//
//  ItemService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
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
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItem
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItem(_ itemID: Int) -> AnyPublisher<PKMItem, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItem(_ itemName: String) -> AnyPublisher<PKMItem, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemAttributeList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItemAttribute
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemAttribute(_ itemAttributeID: Int) -> AnyPublisher<PKMItemAttribute, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemAttribute(_ itemAttributeName: String) -> AnyPublisher<PKMItemAttribute, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemCategoryList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItemCategory
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemCategory(_ itemCategoryID: Int) -> AnyPublisher<PKMItemCategory, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemCategory(_ itemCategoryName: String) -> AnyPublisher<PKMItemCategory, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemFlingEffectList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error>  where T: PKMItemFlingEffect
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemFlingEffect(_ itemFlingEffectsID: Int) -> AnyPublisher<PKMItemFlingEffect, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemFlingEffect(_ itemFlingEffectsName: String) -> AnyPublisher<PKMItemFlingEffect, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemPocketList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItemPocket
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemPocket(_ itemPocketID: Int) -> AnyPublisher<PKMItemPocket, Error>
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func fetchItemPocket(_ itemPocketName: String) -> AnyPublisher<PKMItemPocket, Error>
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



// MARK: - Combine Services

extension ItemService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItem {
        callPaginated(endpoint: API.fetchItemList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItem(_ itemID: Int) -> AnyPublisher<PKMItem, Error> {
        call(endpoint: API.fetchItemByID(itemID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItem(_ itemName: String) -> AnyPublisher<PKMItem, Error> {
        call(endpoint: API.fetchItemByName(itemName))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemAttributeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItemAttribute {
        callPaginated(endpoint: API.fetchItemAttributeList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemAttribute(_ itemAttributeID: Int) -> AnyPublisher<PKMItemAttribute, Error> {
        call(endpoint: API.fetchItemAttributeByID(itemAttributeID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemAttribute(_ itemAttributeName: String) -> AnyPublisher<PKMItemAttribute, Error> {
        call(endpoint: API.fetchItemAttributeByName(itemAttributeName))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemCategoryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItemCategory {
        callPaginated(endpoint: API.fetchItemCategoryList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemCategory(_ itemCategoryID: Int) -> AnyPublisher<PKMItemCategory, Error> {
        call(endpoint: API.fetchItemCategoryByID(itemCategoryID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemCategory(_ itemCategoryName: String) -> AnyPublisher<PKMItemCategory, Error> {
        call(endpoint: API.fetchItemCategoryByName(itemCategoryName))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemFlingEffectList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error>  where T: PKMItemFlingEffect {
        callPaginated(endpoint: API.fetchItemFlingEffectList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemFlingEffect(_ itemFlingEffectsID: Int) -> AnyPublisher<PKMItemFlingEffect, Error> {
        call(endpoint: API.fetchItemFlingEffectByID(itemFlingEffectsID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemFlingEffect(_ itemFlingEffectsName: String) -> AnyPublisher<PKMItemFlingEffect, Error> {
        call(endpoint: API.fetchItemFlingEffectByName(itemFlingEffectsName))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemPocketList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMItemPocket {
        callPaginated(endpoint: API.fetchItemPocketList, paginationState: paginationState)
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemPocket(_ itemPocketID: Int) -> AnyPublisher<PKMItemPocket, Error> {
        call(endpoint: API.fetchItemPocketByID(itemPocketID))
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    public func fetchItemPocket(_ itemPocketName: String) -> AnyPublisher<PKMItemPocket, Error> {
        call(endpoint: API.fetchItemPocketByName(itemPocketName))
    }
}
