//
//  SelfDecodable.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


public protocol SelfDecodable: Decodable {
    static var decoder: JSONDecoder { get }
}
