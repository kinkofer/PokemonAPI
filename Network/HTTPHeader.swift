//
//  HTTPHeader.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


enum HTTPHeader {
    case contentType(MediaType)
    case accept(MediaType)
    
    var key: String {
        switch self {
        case .contentType(_):
            return "Content-Type"
        case .accept(_):
            return "Accept"
        }
    }
}



struct MediaType: OptionSet {
    let rawValue: Int
    
    static let json = MediaType(rawValue: 1 << 0)
    static let html = MediaType(rawValue: 1 << 1)
    static let plainText = MediaType(rawValue: 1 << 2)
    static let png = MediaType(rawValue: 1 << 3)
    static let jpeg = MediaType(rawValue: 1 << 4)
    static let form = MediaType(rawValue: 1 << 5)
    
    init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    
    var headerValue: String {
        var values = [String]()
        
        if self.contains(.json) {
            values.append("application/json")
        }
        
        if self.contains(.html) {
            values.append("text/html")
        }
        
        if self.contains(.plainText) {
            values.append("text/plain")
        }
        
        if self.contains(.png) {
            values.append("image/png")
        }
        
        if self.contains(.jpeg) {
            values.append("image/jpeg")
        }
        
        if self.contains(.form) {
            values.append("application/x-www-form-urlencoded")
        }
        
        return values.joined(separator: "; ")
    }
}



// Taken from https://stackoverflow.com/a/32103136 - Chris 2/7/18
public extension OptionSet where RawValue: FixedWidthInteger {
    func elements() -> AnySequence<Self> {
        var remainingBits = rawValue
        var bitMask: RawValue = 1
        return AnySequence {
            return AnyIterator {
                while remainingBits != 0 {
                    defer { bitMask = bitMask &* 2 }
                    if remainingBits & bitMask != 0 {
                        remainingBits = remainingBits & ~bitMask
                        return Self(rawValue: bitMask)
                    }
                }
                return nil
            }
        }
    }
}
