//
//  Machines.swift
//  PokemonKit
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


open class PKMMachine: Codable, SelfDecodable {
    /// The identifier for this machine resource
    open var id: Int?
    
    /// The TM or HM item that corresponds to this machine
    open var item: PKMNamedAPIResource?
    
    /// The move that is taught by this machine
    open var move: PKMNamedAPIResource?
    
    /// The version group that this machine applies to
    open var versionGroup: PKMNamedAPIResource?
    
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
    public func fetchMachinesList(completion: @escaping (_ result: Result<PKMPagedObject>) -> Void) {
        let urlStr = baseURL + "/machine"
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Machine Information
     
     - parameter machineId: Machine ID
     */
    public func fetchMachine(_ machineId: String, completion: @escaping (_ result: Result<PKMMachine>) -> Void) {
        let urlStr = baseURL + "/machine/" + machineId
        
        HTTPWebService.callWebService(url: URL(string: urlStr), method: .get) { result in
            result.decode(completion: completion)
        }
    }
}
