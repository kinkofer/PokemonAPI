//
//  Publisher+JSON.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//

import Combine
import Foundation


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func requestJSON<Value>() -> AnyPublisher<Value, Error> where Value: Decodable {
        return tryMap {
                assert(!Thread.isMainThread)
                return $0.data
            }
            .extractUnderlyingError()
            .decodeJSON(type: Value.self)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
extension Publisher {
    func decodeJSON<Value>(type: Value.Type) -> Publishers.Decode<Self, Value, JSONDecoder> where Value: Decodable {
        if let selfDecoding = type as? SelfDecodable.Type {
            return decode(type: type, decoder: selfDecoding.decoder)
        }
        else {
            return decode(type: type, decoder: JSONDecoder())
        }
    }
}


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
extension Publisher {
    func extractUnderlyingError() -> Publishers.MapError<Self, Failure> {
        mapError {
            ($0.underlyingError as? Failure) ?? $0
        }
    }
}


private extension Error {
    var underlyingError: Error? {
        let nsError = self as NSError
        if nsError.domain == NSURLErrorDomain && nsError.code == -1009 {
            // "The Internet connection appears to be offline."
            return self
        }
        return nsError.userInfo[NSUnderlyingErrorKey] as? Error
    }
}
