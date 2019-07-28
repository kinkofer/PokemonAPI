//
//  Network.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


enum HTTPMethod: String {
    case get, post, put, delete, patch, head
}



class Network: NSObject {
    static let shared = Network()
    private override init() { }
    
    
    /**
     Creates a URLRequest receiving JSON by default.
     
     - parameter url: The RESTful URL
     - parameter method: A RESTful HTTP request method
     - returns: The URLRequest or nil if the user has not been authenticated.
     - requires: A sessionID or encoded user credentials must be saved in the Network class in order to create the URLRequest.
     */
    func getRequest(with url: URL, method: HTTPMethod) -> URLRequest? {
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return request
    }
    
    
    // MARK: - Start URL Requests
    
    /**
     Starts the URLRequest and returns the response from the server or an error.
     
     - parameter request: The URLRequest
     - parameter completion: Returns the web service response and error
     
        `result`: Success returns the resulting Data, or Failure returns an error. The error is nil unless:
         - the URLSession fails
         - the web service returns an error status code
         - Error with type httpError
     */
    func startData(_ request: URLRequest, completion: @escaping (_ result: Result<Data, HTTPError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                let status = HTTPStatus(code: response.statusCode)
                
                if status == .unauthorized {
                    completion(.failure(.unauthorized))
                }
                else if status.category == .success,
                    let data = data {
                    completion(.success(data))
                }
                else {
                    completion(.failure(.serverResponse(status, data)))
                }
            }
            else if let error = error {
                if let nsError = error as NSError?,
                    nsError.code == HTTPError.timeout.code {
                    completion(.failure(.timeout))
                }
                else {
                    completion(.failure(.other(error)))
                }
            }
            else {
                completion(.failure(.httpError))
            }
        }.resume()
    }
}
