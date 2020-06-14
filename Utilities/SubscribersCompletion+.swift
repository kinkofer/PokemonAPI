//
//  SubscribersCompletion+.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//

import Combine


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
extension Subscribers.Completion {
    public func getError() throws -> Failure {
        if case let .failure(error) = self {
            return error
        }
        throw ErrorFunctionThrowsError.error
    }
    private enum ErrorFunctionThrowsError: Error { case error }
}
