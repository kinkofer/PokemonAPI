//
//  MachineService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMMachineService: HTTPWebService {
    func fetchMachineList(paginationState: PaginationState<PKMMachine>) async throws -> PKMPagedObject<PKMMachine>
    func fetchMachine(_ machineID: Int) async throws -> PKMMachine
}



// MARK: - Web Services

public struct MachineService: PKMMachineService, Sendable {
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
    
    
    
    /**
     Fetch Machines list
     */
    public func fetchMachineList(paginationState: PaginationState<PKMMachine> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMMachine> {
        try await callPaginated(endpoint: API.fetchMachineList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Machine Information
     
     - parameter machineID: Machine ID
     */
    public func fetchMachine(_ machineID: Int) async throws -> PKMMachine {
        try await PKMMachine.decode(from: call(endpoint: API.fetchMachine(machineID)))
    }
}
