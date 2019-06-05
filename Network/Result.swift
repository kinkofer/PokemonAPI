//
//  Result.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


extension Result where Success == Data, Failure == HTTPError {
    /**
     Decode a successful Result to a class specified in your completion. Will return an HTTPError.jsonParsingError if decoding fails, or the original error if the Result is a failure.
     
     - parameter customDecode: Implement a customDecode method to return the desired Decodable object if it's nested in the data or needs to be configured
     - parameter completion: Called when decoding is complete, or when errors are encountered
     */
    func decode<U: Decodable>(customDecode: ((_ data: Data) throws -> U)? = nil, completion: @escaping (_ result: Result<U, HTTPError>) -> Void) {
        switch self {
        case .success(let data):
            do {
                let decoded = try customDecode?(data) ?? U.decode(from: data)
                completion(.success(decoded))
            }
            catch {
                completion(.failure(.jsonParsingError))
            }
        case .failure(let error):
            completion(.failure(error))
        }
    }
}
