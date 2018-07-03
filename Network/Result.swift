//
//  Result.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


public enum Result<T> {
    case success(T)
    case failure(HTTPError)
}


extension Result {
    public init(value: T?, error: HTTPError?) {
        switch (value, error) {
        case (let v?, _):
            self = .success(v)
        case (nil, let e?):
            self = .failure(e)
        case (nil, nil):
            let error = HTTPError(type: .httpError, code: 1, description: "Invalid input: value and error were both nil.")
            self = .failure(error)
        }
    }
}


extension Result where T == Data {
    /**
     Decode a successful Result to a class specified in your completion. Will return an HTTPError.jsonParsingError if decoding fails, or the original error if the Result is a failure.
     
     - parameter customDecode: Implement a customDecode method to return the desired Decodable object if it's nested in the data or needs to be configured
     - parameter completion: Called when decoding is complete, or when errors are encountered
     */
    func decode<U: Decodable>(customDecode: ((_ data: Data) throws -> U)? = nil, completion: @escaping (_ result: Result<U>) -> Void) {
        switch self {
        case .success(let data):
            do {
                let decoded = try customDecode?(data) ?? U.decode(from: data)
                completion(Result<U>(value: decoded, error: nil))
            }
            catch {
                completion(Result<U>(value: nil, error: HTTPError(type: .jsonParsingError)))
            }
        case .failure(let error):
            completion(Result<U>(value: nil, error: error))
        }
    }
}
