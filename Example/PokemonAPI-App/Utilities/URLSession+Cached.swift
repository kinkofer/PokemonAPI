//
//  URLSession+Cached.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 6/9/22.
//

import Foundation


extension URLSession {
    static var cached: URLSession {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        return URLSession(configuration: config)
    }
}
