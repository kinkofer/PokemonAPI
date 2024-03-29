//
//  BerryService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


// MARK: - Protocol

public protocol PKMBerryService: HTTPWebService {
    func fetchBerryList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMBerry
    func fetchBerry(_ berryID: Int, completion: @escaping (_ result: Result<PKMBerry, Error>) -> Void)
    func fetchBerry(_ berryName: String, completion: @escaping (_ result: Result<PKMBerry, Error>) -> Void)
    func fetchBerryFirmnessList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMBerryFirmness
    func fetchBerryFirmness(_ berryFirmnessID: Int, completion: @escaping (_ result: Result<PKMBerryFirmness, Error>) -> Void)
    func fetchBerryFirmness(_ berryFirmnessName: String, completion: @escaping (_ result: Result<PKMBerryFirmness, Error>) -> Void)
    func fetchBerryFlavorList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMBerryFlavor
    func fetchBerryFlavor(_ berryFlavorID: Int, completion: @escaping (_ result: Result<PKMBerryFlavor, Error>) -> Void)
    func fetchBerryFlavor(_ berryFlavorName: String, completion: @escaping (_ result: Result<PKMBerryFlavor, Error>) -> Void)
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerryList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMBerry
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerry(_ berryID: Int) -> AnyPublisher<PKMBerry, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerry(_ berryName: String) -> AnyPublisher<PKMBerry, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerryFirmnessList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMBerryFirmness
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerryFirmness(_ berryFirmnessID: Int) -> AnyPublisher<PKMBerryFirmness, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerryFirmness(_ berryFirmnessName: String) -> AnyPublisher<PKMBerryFirmness, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerryFlavorList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMBerryFlavor
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerryFlavor(_ berryFlavorID: Int) -> AnyPublisher<PKMBerryFlavor, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchBerryFlavor(_ berryFlavorName: String) -> AnyPublisher<PKMBerryFlavor, Error>
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerryList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMBerry
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerry(_ berryID: Int) async throws -> PKMBerry
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerry(_ berryName: String) async throws -> PKMBerry
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerryFirmnessList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMBerryFirmness
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerryFirmness(_ berryFirmnessID: Int) async throws -> PKMBerryFirmness
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerryFirmness(_ berryFirmnessName: String) async throws -> PKMBerryFirmness
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerryFlavorList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMBerryFlavor
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerryFlavor(_ berryFlavorID: Int) async throws -> PKMBerryFlavor
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchBerryFlavor(_ berryFlavorName: String) async throws -> PKMBerryFlavor
}



// MARK: - Web Services

public struct BerryService: PKMBerryService {
    public enum API: APICall {
        case fetchBerryList
        case fetchBerryByID(Int)
        case fetchBerryByName(String)
        case fetchBerryFirmnessList
        case fetchBerryFirmnessByID(Int)
        case fetchBerryFirmnessByName(String)
        case fetchBerryFlavorList
        case fetchBerryFlavorByID(Int)
        case fetchBerryFlavorByName(String)
        
        var path: String {
            switch self {
            case .fetchBerryList:
                return "/berry"
            case .fetchBerryByID(let id):
                return "/berry/\(id)"
            case .fetchBerryByName(let name):
                return "/berry/\(name)"
            case .fetchBerryFirmnessList:
                return "/berry-firmness"
            case .fetchBerryFirmnessByID(let id):
                return "/berry-firmness/\(id)"
                case .fetchBerryFirmnessByName(let name):
                return "/berry-firmness/\(name)"
            case .fetchBerryFlavorList:
                return "/berry-flavor/"
            case .fetchBerryFlavorByID(let id):
                return "/berry-flavor/\(id)"
            case .fetchBerryFlavorByName(let name):
                return "/berry-flavor/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Berry list
     */
    public func fetchBerryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMBerry {
        callPaginated(endpoint: API.fetchBerryList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryId: Berry ID
     */
    public func fetchBerry(_ berryID: Int, completion: @escaping (_ result: Result<PKMBerry, Error>) -> Void) {
        call(endpoint: API.fetchBerryByID(berryID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryName: Berry Name
     */
    public func fetchBerry(_ berryName: String, completion: @escaping (_ result: Result<PKMBerry, Error>) -> Void) {
        call(endpoint: API.fetchBerryByName(berryName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Berry Firmness list
     */
    public func fetchBerryFirmnessList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMBerryFirmness {
        callPaginated(endpoint: API.fetchBerryFirmnessList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessId: Berry Firmness ID
     */
    public func fetchBerryFirmness(_ berryFirmnessID: Int, completion: @escaping (_ result: Result<PKMBerryFirmness, Error>) -> Void) {
        call(endpoint: API.fetchBerryFirmnessByID(berryFirmnessID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessName: Berry Firmness Name
     */
    public func fetchBerryFirmness(_ berryFirmnessName: String, completion: @escaping (_ result: Result<PKMBerryFirmness, Error>) -> Void) {
        call(endpoint: API.fetchBerryFirmnessByName(berryFirmnessName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Berry Flavors list
     */
    public func fetchBerryFlavorList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMBerryFlavor {
        callPaginated(endpoint: API.fetchBerryFlavorList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorId: Berry Flavor ID
     */
    public func fetchBerryFlavor(_ berryFlavorID: Int, completion: @escaping (_ result: Result<PKMBerryFlavor, Error>) -> Void) {
        call(endpoint: API.fetchBerryFlavorByID(berryFlavorID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorName: Berry Flavor Name
     */
    public func fetchBerryFlavor(_ berryFlavorName: String, completion: @escaping (_ result: Result<PKMBerryFlavor, Error>) -> Void) {
        call(endpoint: API.fetchBerryFlavorByName(berryFlavorName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension BerryService {
    /**
     Fetch Berry list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMBerry {
        callPaginated(endpoint: API.fetchBerryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryId: Berry ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerry(_ berryID: Int) -> AnyPublisher<PKMBerry, Error> {
        call(endpoint: API.fetchBerryByID(berryID))
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryName: Berry Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerry(_ berryName: String) -> AnyPublisher<PKMBerry, Error> {
        call(endpoint: API.fetchBerryByName(berryName))
    }
    
    
    /**
     Fetch Berry Firmness list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerryFirmnessList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMBerryFirmness {
        callPaginated(endpoint: API.fetchBerryFirmnessList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessId: Berry Firmness ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerryFirmness(_ berryFirmnessID: Int) -> AnyPublisher<PKMBerryFirmness, Error> {
        call(endpoint: API.fetchBerryFirmnessByID(berryFirmnessID))
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessName: Berry Firmness Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerryFirmness(_ berryFirmnessName: String) -> AnyPublisher<PKMBerryFirmness, Error> {
        call(endpoint: API.fetchBerryFirmnessByName(berryFirmnessName))
    }
    
    
    /**
     Fetch Berry Flavors list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerryFlavorList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMBerryFlavor {
        callPaginated(endpoint: API.fetchBerryFlavorList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorId: Berry Flavor ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerryFlavor(_ berryFlavorID: Int) -> AnyPublisher<PKMBerryFlavor, Error> {
        call(endpoint: API.fetchBerryFlavorByID(berryFlavorID))
    }
    
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorName: Berry Flavor Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchBerryFlavor(_ berryFlavorName: String) -> AnyPublisher<PKMBerryFlavor, Error> {
        call(endpoint: API.fetchBerryFlavorByName(berryFlavorName))
    }
}



// MARK: - Async Services

extension BerryService {
    /**
     Fetch Berry list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerryList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMBerry {
        try await callPaginated(endpoint: API.fetchBerryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryId: Berry ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerry(_ berryID: Int) async throws -> PKMBerry {
        try await PKMBerry.decode(from: call(endpoint: API.fetchBerryByID(berryID)))
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryName: Berry Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerry(_ berryName: String) async throws -> PKMBerry {
        try await PKMBerry.decode(from: call(endpoint: API.fetchBerryByName(berryName)))
    }
    
    
    /**
     Fetch Berry Firmness list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerryFirmnessList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMBerryFirmness {
        try await callPaginated(endpoint: API.fetchBerryFirmnessList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessId: Berry Firmness ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerryFirmness(_ berryFirmnessID: Int) async throws -> PKMBerryFirmness {
        try await PKMBerryFirmness.decode(from: call(endpoint: API.fetchBerryFirmnessByID(berryFirmnessID)))
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessName: Berry Firmness Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerryFirmness(_ berryFirmnessName: String) async throws -> PKMBerryFirmness {
        try await PKMBerryFirmness.decode(from: call(endpoint: API.fetchBerryFirmnessByName(berryFirmnessName)))
    }
    
    
    /**
     Fetch Berry Flavors list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerryFlavorList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<T> where T: PKMBerryFlavor {
        try await callPaginated(endpoint: API.fetchBerryFlavorList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorId: Berry Flavor ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerryFlavor(_ berryFlavorID: Int) async throws -> PKMBerryFlavor {
        try await PKMBerryFlavor.decode(from: call(endpoint: API.fetchBerryFlavorByID(berryFlavorID)))
    }
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorName: Berry Flavor Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchBerryFlavor(_ berryFlavorName: String) async throws -> PKMBerryFlavor {
        try await PKMBerryFlavor.decode(from: call(endpoint: API.fetchBerryFlavorByName(berryFlavorName)))
    }
}
