//
//  LocationService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMLocationService: HTTPWebService {
    func fetchLocationList(paginationState: PaginationState<PKMLocation>) async throws -> PKMPagedObject<PKMLocation>
    func fetchLocation(_ locationID: Int) async throws -> PKMLocation
    func fetchLocationAreaList(paginationState: PaginationState<PKMLocationArea>) async throws -> PKMPagedObject<PKMLocationArea>
    func fetchLocationArea(_ locationAreaID: Int) async throws -> PKMLocationArea
    func fetchPalParkAreaList(paginationState: PaginationState<PKMPalParkArea>) async throws -> PKMPagedObject<PKMPalParkArea>
    func fetchPalParkArea(_ palParkAreaID: Int) async throws -> PKMPalParkArea
    func fetchPalParkArea(_ palParkAreaName: String) async throws -> PKMPalParkArea
    func fetchRegionList(paginationState: PaginationState<PKMRegion>) async throws -> PKMPagedObject<PKMRegion>
    func fetchRegion(_ regionID: Int) async throws -> PKMRegion
    func fetchRegion(_ regionName: String) async throws -> PKMRegion
}



// MARK: - Web Services

public struct LocationService: PKMLocationService, Sendable {
    public enum API: APICall {
        case fetchLocationList
        case fetchLocation(Int)
        case fetchLocationAreaList
        case fetchLocationArea(Int)
        case fetchPalParkAreaList
        case fetchPalParkAreaByID(Int)
        case fetchPalParkAreaByName(String)
        case fetchRegionList
        case fetchRegionByID(Int)
        case fetchRegionByName(String)
        
        var path: String {
            switch self {
            case .fetchLocationList:
                return "/location"
            case .fetchLocation(let id):
                return "/location/\(id)"
            case .fetchLocationAreaList:
                return "/location-area"
            case .fetchLocationArea(let id):
                return "/location-area/\(id)"
            case .fetchPalParkAreaList:
                return "/pal-park-area"
            case .fetchPalParkAreaByID(let id):
                return "/pal-park-area/\(id)"
            case .fetchPalParkAreaByName(let name):
                return "/pal-park-area/\(name)"
            case .fetchRegionList:
                return "/region"
            case .fetchRegionByID(let id):
                return "/region/\(id)"
            case .fetchRegionByName(let name):
                return "/region/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    /**
     Fetch Locations list
     */
    public func fetchLocationList(paginationState: PaginationState<PKMLocation> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMLocation> {
        try await callPaginated(endpoint: API.fetchLocationList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Location Information
     
     - parameter locationID: Location ID
     */
    public func fetchLocation(_ locationID: Int) async throws -> PKMLocation {
        try await PKMLocation.decode(from: call(endpoint: API.fetchLocation(locationID)))
    }
    
    
    /**
     Fetch Location Area list
     */
    public func fetchLocationAreaList(paginationState: PaginationState<PKMLocationArea> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMLocationArea> {
        try await callPaginated(endpoint: API.fetchLocationAreaList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Location Area Information
     
     - parameter locationAreaId: Location Area ID
     */
    public func fetchLocationArea(_ locationAreaID: Int) async throws -> PKMLocationArea {
        try await PKMLocationArea.decode(from: call(endpoint: API.fetchLocationArea(locationAreaID)))
    }
    
    
    /**
     Fetch Pal Park Areas list
     */
    public func fetchPalParkAreaList(paginationState: PaginationState<PKMPalParkArea> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPalParkArea> {
        try await callPaginated(endpoint: API.fetchPalParkAreaList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaID: Pal Park Area ID
     */
    public func fetchPalParkArea(_ palParkAreaID: Int) async throws -> PKMPalParkArea {
        try await PKMPalParkArea.decode(from: call(endpoint: API.fetchPalParkAreaByID(palParkAreaID)))
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaName: Pal Park Area Name
     */
    public func fetchPalParkArea(_ palParkAreaName: String) async throws -> PKMPalParkArea {
        try await PKMPalParkArea.decode(from: call(endpoint: API.fetchPalParkAreaByName(palParkAreaName)))
    }
    
    
    /**
     Fetch Regions list
     */
    public func fetchRegionList(paginationState: PaginationState<PKMRegion> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMRegion> {
        try await callPaginated(endpoint: API.fetchRegionList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionID: Region ID
     */
    public func fetchRegion(_ regionID: Int) async throws -> PKMRegion {
        try await PKMRegion.decode(from: call(endpoint: API.fetchRegionByID(regionID)))
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionName: Region Name
     */
    public func fetchRegion(_ regionName: String) async throws -> PKMRegion {
        try await PKMRegion.decode(from: call(endpoint: API.fetchRegionByName(regionName)))
    }
}
