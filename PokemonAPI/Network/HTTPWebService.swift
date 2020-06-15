//
//  HTTPWebService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation
import Combine


public protocol HTTPWebService {
    var session: URLSession { get }
    var baseURL: String { get }
}


extension HTTPWebService {
    func call(endpoint: APICall, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        do {
            let request = try endpoint.getUrlRequest(baseURL: baseURL)
            // Make the request
            session.startData(request) { result in
                completion(result)
            }
        }
        catch let error {
            completion(.failure(HTTPError.other(error)))
        }
    }
    
    
    func callPaginated<T>(endpoint: APICall, paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) {
        do {
            let request = try endpoint.getPaginatedUrlRequest(baseURL: baseURL, paginationState: paginationState)
            
            guard let url = request.url else {
                return completion(.failure(HTTPError.invalidRequest))
            }
            
            // Make the request
            session.startData(request) { result in
                switch result {
                case .success(let data):
                    do {
                        let pagedObject = try PKMPagedObject<T>.decode(from: data)
                        pagedObject.update(with: paginationState, currentUrl: url.absoluteString)
                        completion(.success(pagedObject))
                    }
                    catch {
                        completion(.failure(HTTPError.jsonParsingError))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        catch let error {
            completion(.failure(HTTPError.other(error)))
        }
    }
}



extension HTTPWebService {
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func call<Value>(endpoint: APICall) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try endpoint.getUrlRequest(baseURL: baseURL)
            return session
                .dataTaskPublisher(for: request)
                .requestJSON()
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func callPaginated<Value>(endpoint: APICall, paginationState: PaginationState<Value>) -> AnyPublisher<PKMPagedObject<Value>, Error> where Value: Decodable {
        do {
            let request = try endpoint.getPaginatedUrlRequest(baseURL: baseURL, paginationState: paginationState)
            return session
                .dataTaskPublisher(for: request)
                .requestJSON()
        } catch let error {
            return Fail<PKMPagedObject<Value>, Error>(error: error).eraseToAnyPublisher()
        }
    }
}
