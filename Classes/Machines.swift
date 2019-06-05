//
//  Machines.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


open class PKMMachine: Codable, SelfDecodable {
    /// The identifier for this machine resource
    open var id: Int?
    
    /// The TM or HM item that corresponds to this machine
    open var item: PKMNamedAPIResource<PKMItem>?
    
    /// The move that is taught by this machine
    open var move: PKMNamedAPIResource<PKMMove>?
    
    /// The version group that this machine applies to
    open var versionGroup: PKMNamedAPIResource<PKMVersion>?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}



// MARK: - Web Services

open class MachineService {
    /**
     Fetch Machines list
     */
    public static func fetchMachineList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: PKMMachine {
        let urlStr = baseURL + "/machine"
        HTTPWebService.callPaginatedWebService(url: URL(string: urlStr), paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Machine Information
     
     - parameter machineId: Machine ID
     */
    public static func fetchMachine(_ machineId: Int, completion: @escaping (_ result: Result<PKMMachine, HTTPError>) -> Void) {
        let urlStr = baseURL + "/machine/\(machineId)"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
