//
//  Resource.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 9/11/18.
//

import Foundation


/// API Referenced Resource
public struct PKMAPIResource<T>: Codable, Sendable {
    /// The URL of the referenced resource
    public let url: String?
    
    /// The name of the referenced resource
    public let name: String?
}
