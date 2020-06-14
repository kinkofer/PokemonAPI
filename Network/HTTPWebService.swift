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



// FIXME: Temporary, remove after refactor
class HTTPWebServiceClient: HTTPWebService {
    var baseURL: String { return "https://pokeapi.co/api/v2" }
    var session: URLSession { return URLSession.shared }
}


extension HTTPWebServiceClient {
    /**
     Configures and calls a web service and returns the response or an error through the completion.
     
     - parameter url: The web service url
     - parameter method: The HTTP method
     - parameter body: The body to be sent with the call
     - parameter headers: Configures the HTTP request with the included headers. By default, the Accept and Content-Type headers are configured with json
     - parameter completion: Returns the web service response and error
     
     `response`: A data object containing the response from the server
     
     `error`: Nil unless an error occured
     */
    static func callWebService(url: URL?, method: HTTPMethod, body: Data? = nil, headers: [HTTPHeader] = [], completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(HTTPError.invalidRequest))
            return
        }
        
        // Construct the default request
        if var request = Network.shared.getRequest(with: url, method: method) {
            // Add (or overwrite default) headers
            request.addHeaders(headers)
            
            // Add optional body
            request.httpBody = body
            
            // Make the request
            Network.shared.startData(request) { result in
                completion(result)
            }
        }
        else {
            completion(.failure(HTTPError.unauthorized))
        }
    }
    
    
    /**
     Configures and calls a web service and returns the response or an error through the completion.
     
     - parameter url: The web service url
     - parameter paginationState: The state of a paginated web service call. Use .initial for the first call, then .continuing for subsequent calls.
     - parameter headers: Configures the HTTP request with the included headers. By default, the Accept and Content-Type headers are configured with json
     - parameter completion: Returns the web service response and error
     */
    static func callPaginatedWebService<T>(url: URL?, paginationState: PaginationState<T>, headers: [HTTPHeader] = [], completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: Decodable {
        guard var url = url else {
            completion(.failure(HTTPError.invalidRequest))
            return
        }
        
        // Append pageLimit and offset to url
        var pageLimit = 0
        var offset = 0
        
        switch paginationState {
        case .initial(pageLimit: let limit):
            pageLimit = limit
        case .continuing(let paginatedResult, let relationship):
            pageLimit = paginatedResult.limit
            offset = paginatedResult.getOffset(for: relationship)
        }
        
        url.appendQuery(parameters: ["limit": String(pageLimit),
                                     "offset": String(offset)])
        
        // Construct the default request
        if var request = Network.shared.getRequest(with: url, method: .get) {
            // Add (or overwrite default) headers
            request.addHeaders(headers)
            
            // Make the request
            Network.shared.startData(request) { result in
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
        else {
            completion(.failure(HTTPError.unauthorized))
        }
    }
}

