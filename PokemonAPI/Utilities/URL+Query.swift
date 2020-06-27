//
//  URL+Query.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


extension URL {
    /// Adds a key-value parameter to the end of the url string, like "key=value", or removes the parameter if the value is nil.
    /// - parameter key: A query parameter key
    /// - parameter value: A query parameter value
    /// - note: The query indicator (?) will be added if it does not exist, otherwise the parameters will be appended with "&"
    public mutating func appendQueryParameter(key: String, value: String?) {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return
        }
        
        var queryItems = components.queryItems ?? [URLQueryItem]()
        
        let matchedItems = queryItems.enumerated().filter { $0.element.name == key }
        
        if matchedItems.count > 1 {
            // remove duplicates, and add the query item (or remove if value is nil)
            if let v = value {
                matchedItems.reversed().forEach { queryItems.remove(at: $0.offset) }
                queryItems.append(URLQueryItem(name: key, value: v))
            }
            else {
                matchedItems.reversed().forEach { queryItems.remove(at: $0.offset) }
            }
        }
        else if let item = matchedItems.first {
            if let v = value {
                queryItems[item.offset] = URLQueryItem(name: key, value: v)
            }
            else {
                // remove if value is nil
                queryItems.remove(at: item.offset)
            }
        }
        else if let v = value {
            // key doesn't exist, add to url
            queryItems.append(URLQueryItem(name: key, value: v))
        }
        
        components.queryItems = queryItems
        
        self = components.url!
    }
    
    
    /// Adds key-value parameters to the end of the url string, like "key=value"
    /// - parameter parameters: A dictionary of key-value pairs that will be appended to the url
    /// - note: The query indicator (?) will be added if it does not exist, otherwise the parameters will be appended with "&"
    public mutating func appendQuery(parameters: [String: String]) {
        parameters.forEach {
            self.appendQueryParameter(key: $0.key, value: $0.value)
        }
    }
    
    
    /// Removes a key-value parameter pair for a matching key
    /// - parameter key: A key matching a query parameter key in a url
    public mutating func removeQueryParameter(_ key: String) {
        self.appendQueryParameter(key: key, value: nil)
    }
    
    
    /// Compares components, which doesn't require query parameters to be in any particular order
    public func compareComponents(_ url: URL) -> Bool {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return false }
        
        return components.scheme == urlComponents.scheme &&
            components.host == urlComponents.host &&
            components.path == urlComponents.path &&
            components.queryItems?.enumerated().compactMap { $0.element.name }.sorted() == urlComponents.queryItems?.enumerated().compactMap { $0.element.name }.sorted() &&
            components.queryItems?.enumerated().compactMap { $0.element.value }.sorted() == urlComponents.queryItems?.enumerated().compactMap { $0.element.value }.sorted()
    }
}
