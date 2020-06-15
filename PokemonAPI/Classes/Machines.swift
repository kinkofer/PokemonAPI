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
