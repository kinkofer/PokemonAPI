//
//  MachineService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


protocol PKMMachineService: HTTPWebService {
    func fetchMachineList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMachine
    func fetchMachine(_ machineID: Int, completion: @escaping (_ result: Result<PKMMachine, Error>) -> Void)
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMachineList<T>(paginationState: PaginationState<T>) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMachine
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func fetchMachine(_ machineID: Int) -> AnyPublisher<PKMMachine, Error>
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMachineList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMachine
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchMachine(_ machineID: Int) async throws -> PKMMachine
}



// MARK: - Web Services

public struct MachineService: PKMMachineService {
    public enum API: APICall {
        case fetchMachineList
        case fetchMachine(Int)
        
        var path: String {
            switch self {
            case .fetchMachineList:
                return "/machine"
            case .fetchMachine(let id):
                return "/machine/\(id)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Machines list
     */
    public func fetchMachineList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMMachine {
        callPaginated(endpoint: API.fetchMachineList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Machine Information
     
     - parameter machineID: Machine ID
     */
    public func fetchMachine(_ machineID: Int, completion: @escaping (_ result: Result<PKMMachine, Error>) -> Void) {
        call(endpoint: API.fetchMachine(machineID)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Combine Services

extension MachineService {
    /**
     Fetch Machines list
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMachineList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20)) -> AnyPublisher<PKMPagedObject<T>, Error> where T: PKMMachine {
        callPaginated(endpoint: API.fetchMachineList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Machine Information
     
     - parameter machineID: Machine ID
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    public func fetchMachine(_ machineID: Int) -> AnyPublisher<PKMMachine, Error> {
        call(endpoint: API.fetchMachine(machineID))
    }
}



// MARK: - Async Services

extension MachineService {
    /**
     Fetch Machines list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMachineList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMMachine {
        try await callPaginated(endpoint: API.fetchMachineList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Machine Information
     
     - parameter machineID: Machine ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchMachine(_ machineID: Int) async throws -> PKMMachine {
        try await PKMMachine.decode(from: call(endpoint: API.fetchMachine(machineID)))
    }
}
