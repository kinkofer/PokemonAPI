//
//  Machines.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation


public struct PKMMachine: Codable, SelfDecodable, Sendable {
    /// The identifier for this machine resource
    public let id: Int?
    
    /// The TM or HM item that corresponds to this machine
    public let item: PKMAPIResource<PKMItem>?
    
    /// The move that is taught by this machine
    public let move: PKMAPIResource<PKMMove>?
    
    /// The version group that this machine applies to
    public let versionGroup: PKMAPIResource<PKMVersionGroup>?
    
    public static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
