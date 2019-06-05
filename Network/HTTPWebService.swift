//
//  HTTPWebService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


/// - important: Do not use this class directly from outside the framework
public class HTTPWebService: NSObject {
    
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
    static func callWebService(url: URL?, method: HTTPMethod, body: Data? = nil, headers: [HTTPHeader] = [], completion: @escaping (_ result: Result<Data, HTTPError>) -> Void) {
        guard let url = url else {
            completion(.failure(.invalidRequest))
            return
        }
        
        // Construct the default request
        if var request = Network.shared.getRequest(with: url, method: method) {
            // Add (or overwrite default) headers
            for header in headers {
                switch header {
                case .contentType(let mediaType):
                    request.setValue(mediaType.headerValue, forHTTPHeaderField: header.key)
                case .accept(let mediaType):
                    request.setValue(mediaType.headerValue, forHTTPHeaderField: header.key)
                }
            }
            
            // Add optional body
            request.httpBody = body
            
            // Make the request
            Network.shared.startData(request) { result in
                completion(result)
            }
        }
        else {
            completion(.failure(.unauthorized))
        }
    }
    
    
    /**
     Configures and calls a web service and returns the response or an error through the completion.
     
     - parameter url: The web service url
     - parameter paginationState: The state of a paginated web service call. Use .initial for the first call, then .continuing for subsequent calls.
     - parameter headers: Configures the HTTP request with the included headers. By default, the Accept and Content-Type headers are configured with json
     - parameter completion: Returns the web service response and error
     */
    static func callPaginatedWebService<T>(url: URL?, paginationState: PaginationState<T>, headers: [HTTPHeader] = [], completion: @escaping (_ result: Result<PKMPagedObject<T>, HTTPError>) -> Void) where T: Decodable {
        guard var url = url else {
            completion(.failure(.invalidRequest))
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
            for header in headers {
                switch header {
                case .contentType(let mediaType):
                    request.setValue(mediaType.headerValue, forHTTPHeaderField: header.key)
                case .accept(let mediaType):
                    request.setValue(mediaType.headerValue, forHTTPHeaderField: header.key)
                }
            }
            
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
                        completion(.failure(.jsonParsingError))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        else {
            completion(.failure(.unauthorized))
        }
    }
}

