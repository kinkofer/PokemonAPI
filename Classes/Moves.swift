//
//  Moves.swift
//  PokemonKit
//
//  Created by Christopher Jennewein on 6/27/18.
//

import Foundation



/// Contest Combo Sets
open class PKMContestComboSets: Codable {
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in contests
    open var normal: PKMContestComboDetail?
    
    /// A detail of moves this move can be used before or after, granting additional appeal points in super contests
    open var `super`: PKMContestComboDetail?
}


/// Contest Combo Detail
open class PKMContestComboDetail: Codable, SelfDecodable {
    
    /// A list of moves to use before this move
    open var useBefore: [PKMNamedAPIResource]?
    
    /// A list of moves to use after this move
    open var useAfter: [PKMNamedAPIResource]?
    
    public static var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
