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
        var request = URLRequest(url: url) // initialize request
        
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
    func startData(_ request: URLRequest, completion: @escaping (_ result: Result<Data>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
                let response = response as? HTTPURLResponse {
                let statusCode = response.statusCode
                
                if self.statusCodeIsSuccess(statusCode) {
                    completion(Result(value: data, error: nil))
                }
                else if statusCode == 401 {
                    completion(Result(value: nil, error: HTTPError(type: .unauthorized)))
                }
                else {
                    let description = self.errorDescription(for: statusCode, withResponse: data)
                    let error = HTTPError(type: .httpError, code: statusCode, description: description)
                    
                    completion(Result(value: nil, error: error))
                }
            }
            else if let error = error as NSError? {
                completion(Result(value: nil, error: HTTPError(from: error)))
            }
            else {
                completion(Result(value: nil, error: HTTPError(type: .httpError)))
            }
        }.resume()
    }
    
    
    /**
     Starts the URLRequest and returns the response from the server as a JSON object or an error.
     
     - parameter request: The URLRequest
     - parameter completion: Returns the web service response and error
     
     `result`: Success returns the resulting json object or array, or Failure returns an error. The error is nil unless:
     - the URLSession fails
     - the web service returns an error status code
     - Error with type httpError
     - the JSON cannot be parsed
     - Error with type jsonParsingError
     */
    func startJSON(_ request: URLRequest, completion: @escaping (_ result: Result<Any>) -> Void) {
        startData(request) { result in
            switch result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    completion(Result(value: json, error: nil))
                }
                catch {
                    completion(Result(value: nil, error: HTTPError(type: .jsonParsingError)))
                }
            case .failure(let error):
                completion(Result(value: nil, error: error))
            }
        }
    }
    
    
    /**
     Starts the URLRequest and returns the response from the server as a String or an error.
     
     - parameter request: The URLRequest
     - parameter completion: Returns the web service response and error
     
     `result`: Success returns the resulting String, or Failure returns an error. The error is nil unless:
     - the URLSession fails
     - the web service returns an error status code
     - Error with type httpError
     - the string cannot be parsed
     - Error with type stringParsingError
     */
    func startString(_ request: URLRequest, completion: @escaping (_ response: Result<String>) -> Void) {
        startData(request) { result in
            switch result {
            case .success(let data):
                if let str = String(data: data, encoding: .utf8) {
                    completion(Result(value: str, error: nil))
                }
                else {
                    completion(Result(value: nil, error: HTTPError(type: .stringParsingError)))
                }
            case .failure(let error):
                completion(Result(value: nil, error: error))
            }
        }
    }
    
    
    
    // MARK: -
    
    func statusCodeIsSuccess(_ statusCode: Int) -> Bool {
        return (statusCode >= 200 && statusCode < 300) ? true : false
    }
    
    
    /**
     Creates a user info dictionary that can be added to an Error if a web service returns a failed status code
     - note: Web services with status in the 400 range may also include an error description message in the body
     
     - parameters:
     - forStatusCode: The HTTP status code returned from the web service call
     - withResponseData: The raw response object from the web service call
     */
    func userInfoDictionary(for statusCode: Int, withResponse data: Data!) -> [String: String]? {
        guard !data.isEmpty && statusCode >= 400 && statusCode < 500 else {
            return nil
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let str = json as? String {
                return [NSLocalizedDescriptionKey: str]
            }
            else {
                return nil
            }
        }
        catch _ as NSError {
            return nil
        }
    }
    
    
    /**
     Returns an error description if a web service returns a failed status code
     - note: Web services with status in the 400 range may also include an error description message in the body
     
     - parameters:
     - forStatusCode: The HTTP status code returned from the web service call
     - withResponseData: The raw response object from the web service call
     */
    func errorDescription(for statusCode: Int, withResponse data: Data!) -> String? {
        guard !data.isEmpty && statusCode >= 400 && statusCode < 500 else {
            return nil
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dict = json as? [String: String] {
                return dict["detail"]
            }
            else {
                return nil
            }
        }
        catch _ as NSError {
            return nil
        }
    }
}
