//
//  BerryService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


// MARK: - Protocol

public protocol PKMBerryService: HTTPWebService {
    func fetchBerryList(paginationState: PaginationState<PKMBerry>) async throws -> PKMPagedObject<PKMBerry>
    func fetchBerry(_ berryID: Int) async throws -> PKMBerry
    func fetchBerry(_ berryName: String) async throws -> PKMBerry
    func fetchBerryFirmnessList(paginationState: PaginationState<PKMBerryFirmness>) async throws -> PKMPagedObject<PKMBerryFirmness>
    func fetchBerryFirmness(_ berryFirmnessID: Int) async throws -> PKMBerryFirmness
    func fetchBerryFirmness(_ berryFirmnessName: String) async throws -> PKMBerryFirmness
    func fetchBerryFlavorList(paginationState: PaginationState<PKMBerryFlavor>) async throws -> PKMPagedObject<PKMBerryFlavor>
    func fetchBerryFlavor(_ berryFlavorID: Int) async throws -> PKMBerryFlavor
    func fetchBerryFlavor(_ berryFlavorName: String) async throws -> PKMBerryFlavor
}



// MARK: - Web Services

public struct BerryService: PKMBerryService, Sendable {
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
    
    
    
    /**
     Fetch Berry list
     */
    public func fetchBerryList(paginationState: PaginationState<PKMBerry> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMBerry> {
        try await callPaginated(endpoint: API.fetchBerryList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryId: Berry ID
     */
    public func fetchBerry(_ berryID: Int) async throws -> PKMBerry {
        try await PKMBerry.decode(from: call(endpoint: API.fetchBerryByID(berryID)))
    }
    
    
    /**
     Fetch Berry Information
     
     - parameter berryName: Berry Name
     */
    public func fetchBerry(_ berryName: String) async throws -> PKMBerry {
        try await PKMBerry.decode(from: call(endpoint: API.fetchBerryByName(berryName)))
    }
    
    
    /**
     Fetch Berry Firmness list
     */
    public func fetchBerryFirmnessList(paginationState: PaginationState<PKMBerryFirmness> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMBerryFirmness> {
        try await callPaginated(endpoint: API.fetchBerryFirmnessList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessId: Berry Firmness ID
     */
    public func fetchBerryFirmness(_ berryFirmnessID: Int) async throws -> PKMBerryFirmness {
        try await PKMBerryFirmness.decode(from: call(endpoint: API.fetchBerryFirmnessByID(berryFirmnessID)))
    }
    
    
    /**
     Fetch Berry Firmness Information
     
     - parameter berryFirmnessName: Berry Firmness Name
     */
    public func fetchBerryFirmness(_ berryFirmnessName: String) async throws -> PKMBerryFirmness {
        try await PKMBerryFirmness.decode(from: call(endpoint: API.fetchBerryFirmnessByName(berryFirmnessName)))
    }
    
    
    /**
     Fetch Berry Flavors list
     */
    public func fetchBerryFlavorList(paginationState: PaginationState<PKMBerryFlavor> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMBerryFlavor> {
        try await callPaginated(endpoint: API.fetchBerryFlavorList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorId: Berry Flavor ID
     */
    public func fetchBerryFlavor(_ berryFlavorID: Int) async throws -> PKMBerryFlavor {
        try await PKMBerryFlavor.decode(from: call(endpoint: API.fetchBerryFlavorByID(berryFlavorID)))
    }
    
    
    /**
     Fetch Berry Flavor Information
     
     - parameter berryFlavorName: Berry Flavor Name
     */
    public func fetchBerryFlavor(_ berryFlavorName: String) async throws -> PKMBerryFlavor {
        try await PKMBerryFlavor.decode(from: call(endpoint: API.fetchBerryFlavorByName(berryFlavorName)))
    }
}
