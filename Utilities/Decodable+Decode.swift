//
//  Decodable+Decode.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


extension Decodable {
    public static func decode(from data: Data) throws -> Self {
        if let selfDecoding = self as? SelfDecodable.Type {
            return try selfDecoding.decoder.decode(self, from: data)
        }
        else {
            return try JSONDecoder().decode(self, from: data)
        }
    }
}



extension Array where Element: Decodable {
    public static func decode(from data: Data) throws -> Array {
        if let selfDecoding = Element.self as? SelfDecodable.Type {
            return try selfDecoding.decoder.decode(self, from: data)
        }
        else {
            return try JSONDecoder().decode(self, from: data)
        }
    }
}
