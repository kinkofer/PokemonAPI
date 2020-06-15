//
//  Publisher+Result.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Combine
import Foundation


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
extension Publisher {
    /// The closure parameter is a Result from the sink's success (Output) or failure (Failure)
    public func sinkToResult(_ result: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
        return sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                result(.failure(error))
            default: break
            }
        }, receiveValue: { value in
            result(.success(value))
        })
    }
}
