//
//  URL+Query.swift
//  PokemonKit
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


extension URL {
    /// Adds key-value parameters to the end of the url string, like "key=value"
    /// - parameter parameters: A dictionary of key-value pairs that will be appended to the url
    /// - note: The query indicator (?) will be added if it does not exist, otherwise the parameters will be appended with "&"
    public mutating func appendQuery(parameters: [String: String]) {
        var components: URLComponents! = URLComponents(url: self, resolvingAgainstBaseURL: false)
        if let queryItems = components.queryItems {
            components.queryItems = queryItems + parameters.keys.map { URLQueryItem(name: $0, value: parameters[$0]) }
        }
        else {
            components.queryItems = parameters.keys.map { URLQueryItem(name: $0, value: parameters[$0]) }
        }
        
        self = components.url!
    }
}
