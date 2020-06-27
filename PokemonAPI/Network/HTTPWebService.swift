//
//  HTTPWebService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation
import Combine


enum HTTPMethod: String {
    case get, post, put, delete, patch, head
}


public protocol HTTPWebService {
    var session: URLSession { get }
    var baseURL: String { get }
}


extension HTTPWebService {
    func call(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        do {
            let request = try endpoint.createUrlRequest(baseURL: baseURL, method: method, headers: headers, body: body)
            // Make the request
            session.startData(request) { result in
                completion(result)
            }
        }
        catch let error {
            completion(.failure(HTTPError.other(error)))
        }
    }
    
    
    func callPaginated<T>(endpoint: APICall, paginationState: PaginationState<T>, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) {
        do {
            let request = try endpoint.createUrlRequest(baseURL: baseURL, paginationState: paginationState, method: method, headers: headers, body: body)
            
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
    func call<Value>(endpoint: APICall, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) -> AnyPublisher<Value, Error> where Value: Decodable {
        do {
            let request = try endpoint.createUrlRequest(baseURL: baseURL, method: method, headers: headers, body: body)
            return session
                .dataTaskPublisher(for: request)
                .requestJSON()
        } catch let error {
            return Fail<Value, Error>(error: error).eraseToAnyPublisher()
        }
    }
    
    
    @available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
    func callPaginated<Value>(endpoint: APICall, paginationState: PaginationState<Value>, method: HTTPMethod = .get, headers: [HTTPHeader]? = nil, body: Data? = nil) -> AnyPublisher<PKMPagedObject<Value>, Error> where Value: Decodable {
        do {
            let request = try endpoint.createUrlRequest(baseURL: baseURL, paginationState: paginationState, method: method, headers: headers, body: body)
            return session
                .dataTaskPublisher(for: request)
                .requestJSON()
        } catch let error {
            return Fail<PKMPagedObject<Value>, Error>(error: error).eraseToAnyPublisher()
        }
    }
}
