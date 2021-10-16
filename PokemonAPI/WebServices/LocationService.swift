//
//  LocationService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMLocationService: HTTPWebService {
    func fetchLocationList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMLocation
    func fetchLocation(_ locationID: Int, completion: @escaping (_ result: Result<PKMLocation, Error>) -> Void)
    func fetchLocationAreaList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMLocationArea
    func fetchLocationArea(_ locationAreaID: Int, completion: @escaping (_ result: Result<PKMLocationArea, Error>) -> Void)
    func fetchPalParkAreaList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPalParkArea
    func fetchPalParkArea(_ palParkAreaID: Int, completion: @escaping (_ result: Result<PKMPalParkArea, Error>) -> Void)
    func fetchPalParkArea(_ palParkAreaName: String, completion: @escaping (_ result: Result<PKMPalParkArea, Error>) -> Void)
    func fetchRegionList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMRegion
    func fetchRegion(_ regionID: Int, completion: @escaping (_ result: Result<PKMRegion, Error>) -> Void)
    func fetchRegion(_ regionName: String, completion: @escaping (_ result: Result<PKMRegion, Error>) -> Void)
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchLocationList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLocation
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchLocation(_ locationID: Int) -> AnyPublisher<PKMLocation, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchLocationAreaList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLocationArea
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchLocationArea(_ locationAreaID: Int) -> AnyPublisher<PKMLocationArea, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchPalParkAreaList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMPalParkArea
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchPalParkArea(_ palParkAreaID: Int) -> AnyPublisher<PKMPalParkArea, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchPalParkArea(_ palParkAreaName: String) -> AnyPublisher<PKMPalParkArea, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchRegionList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMRegion
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchRegion(_ regionID: Int) -> AnyPublisher<PKMRegion, Error>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchRegion(_ regionName: String) -> AnyPublisher<PKMRegion, Error>
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchLocationList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMLocation
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchLocation(_ locationID: Int) async throws -> PKMLocation
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchLocationAreaList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMLocationArea
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchLocationArea(_ locationAreaID: Int) async throws -> PKMLocationArea
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPalParkAreaList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPalParkArea
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPalParkArea(_ palParkAreaID: Int) async throws -> PKMPalParkArea
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPalParkArea(_ palParkAreaName: String) async throws -> PKMPalParkArea
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchRegionList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMRegion
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchRegion(_ regionID: Int) async throws -> PKMRegion
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchRegion(_ regionName: String) async throws -> PKMRegion
}



// MARK: - Web Services

public struct LocationService: PKMLocationService {
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
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Locations list
     */
    public func fetchLocationList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMLocation {
        callPaginated(endpoint: API.fetchLocationList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Location Information
     
     - parameter locationID: Location ID
     */
    public func fetchLocation(_ locationID: Int, completion: @escaping (_ result: Result<PKMLocation, Error>) -> Void) {
        call(endpoint: API.fetchLocation(locationID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Location Area list
     */
    public func fetchLocationAreaList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMLocationArea {
        callPaginated(endpoint: API.fetchLocationAreaList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Location Area Information
     
     - parameter locationAreaId: Location Area ID
     */
    public func fetchLocationArea(_ locationAreaId: Int, completion: @escaping (_ result: Result<PKMLocationArea, Error>) -> Void) {
        call(endpoint: API.fetchLocationArea(locationAreaId)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pal Park Areas list
     */
    public func fetchPalParkAreaList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPalParkArea {
        callPaginated(endpoint: API.fetchPalParkAreaList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaID: Pal Park Area ID
     */
    public func fetchPalParkArea(_ palParkAreaID: Int, completion: @escaping (_ result: Result<PKMPalParkArea, Error>) -> Void) {
        call(endpoint: API.fetchPalParkAreaByID(palParkAreaID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaName: Pal Park Area Name
     */
    public func fetchPalParkArea(_ palParkAreaName: String, completion: @escaping (_ result: Result<PKMPalParkArea, Error>) -> Void) {
        call(endpoint: API.fetchPalParkAreaByName(palParkAreaName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Regions list
     */
    public func fetchRegionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMRegion {
        callPaginated(endpoint: API.fetchRegionList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionID: Region ID
     */
    public func fetchRegion(_ regionID: Int, completion: @escaping (_ result: Result<PKMRegion, Error>) -> Void) {
        call(endpoint: API.fetchRegionByID(regionID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionName: Region Name
     */
    public func fetchRegion(_ regionName: String, completion: @escaping (_ result: Result<PKMRegion, Error>) -> Void) {
        call(endpoint: API.fetchRegionByName(regionName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension LocationService {
    /**
     Fetch Locations list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchLocationList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLocation {
        callPaginated(endpoint: API.fetchLocationList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Location Information
     
     - parameter locationID: Location ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchLocation(_ locationID: Int) -> AnyPublisher<PKMLocation, Error> {
        call(endpoint: API.fetchLocation(locationID))
    }
    
    
    /**
     Fetch Location Area list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchLocationAreaList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMLocationArea {
        callPaginated(endpoint: API.fetchLocationAreaList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Location Area Information
     
     - parameter locationAreaId: Location Area ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchLocationArea(_ locationAreaID: Int) -> AnyPublisher<PKMLocationArea, Error> {
        call(endpoint: API.fetchLocationArea(locationAreaID))
    }
    
    
    /**
     Fetch Pal Park Areas list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchPalParkAreaList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMPalParkArea {
        callPaginated(endpoint: API.fetchPalParkAreaList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaID: Pal Park Area ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchPalParkArea(_ palParkAreaID: Int) -> AnyPublisher<PKMPalParkArea, Error> {
        call(endpoint: API.fetchPalParkAreaByID(palParkAreaID))
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaName: Pal Park Area Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchPalParkArea(_ palParkAreaName: String) -> AnyPublisher<PKMPalParkArea, Error> {
        call(endpoint: API.fetchPalParkAreaByName(palParkAreaName))
    }
    
    
    /**
     Fetch Regions list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchRegionList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMRegion {
        callPaginated(endpoint: API.fetchRegionList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionID: Region ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchRegion(_ regionID: Int) -> AnyPublisher<PKMRegion, Error> {
        call(endpoint: API.fetchRegionByID(regionID))
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionName: Region Name
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchRegion(_ regionName: String) -> AnyPublisher<PKMRegion, Error> {
        call(endpoint: API.fetchRegionByName(regionName))
    }
}



// MARK: - Async Services

extension LocationService {
    /**
     Fetch Locations list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchLocationList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMLocation {
        try await callPaginated(endpoint: API.fetchLocationList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Location Information
     
     - parameter locationID: Location ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchLocation(_ locationID: Int) async throws -> PKMLocation {
        try await PKMLocation.decode(from: call(endpoint: API.fetchLocation(locationID)))
    }
    
    
    /**
     Fetch Location Area list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchLocationAreaList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMLocationArea {
        try await callPaginated(endpoint: API.fetchLocationAreaList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Location Area Information
     
     - parameter locationAreaId: Location Area ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchLocationArea(_ locationAreaID: Int) async throws -> PKMLocationArea {
        try await PKMLocationArea.decode(from: call(endpoint: API.fetchLocationArea(locationAreaID)))
    }
    
    
    /**
     Fetch Pal Park Areas list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPalParkAreaList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPalParkArea {
        try await callPaginated(endpoint: API.fetchPalParkAreaList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaID: Pal Park Area ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPalParkArea(_ palParkAreaID: Int) async throws -> PKMPalParkArea {
        try await PKMPalParkArea.decode(from: call(endpoint: API.fetchPalParkAreaByID(palParkAreaID)))
    }
    
    
    /**
     Fetch Pal Park Area Information
     
     - parameter palParkAreaName: Pal Park Area Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPalParkArea(_ palParkAreaName: String) async throws -> PKMPalParkArea {
        try await PKMPalParkArea.decode(from: call(endpoint: API.fetchPalParkAreaByName(palParkAreaName)))
    }
    
    
    /**
     Fetch Regions list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchRegionList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMRegion {
        try await callPaginated(endpoint: API.fetchRegionList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionID: Region ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchRegion(_ regionID: Int) async throws -> PKMRegion {
        try await PKMRegion.decode(from: call(endpoint: API.fetchRegionByID(regionID)))
    }
    
    
    /**
     Fetch Region Information
     
     - parameter regionName: Region Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchRegion(_ regionName: String) async throws -> PKMRegion {
        try await PKMRegion.decode(from: call(endpoint: API.fetchRegionByName(regionName)))
    }
}
