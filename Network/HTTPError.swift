//
//  HTTPError.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/25/18.
//

import Foundation


@objc public class HTTPError: NSObject, Error {
    public enum ErrorType: LocalizedError {
        // Request Error cases
        
        /// The request could not be constructed
        case invalidRequest
        /// The body of the request could not be created
        case unexpectedBody
        
        // Response Error cases
        
        /// The web service returned a unknown error, like a 500
        case httpError
        /// The response data did not have the expected format, value, or type
        case unexpectedResponse
        /// The web service did not return valid JSON
        case jsonParsingError
        /// The web service did not return valid String data
        case stringParsingError
        /// HTTP error 401
        case unauthorized
        /// HTTP error 403
        case forbidden
        
        /// A network connection could not be made
        case noNetwork
        
        
        /// Description from the custom ErrorType
        var description: String {
            switch self {
            case .invalidRequest:
                return NSLocalizedString("The request could not be made. Please change and try again.", comment: "Invalid Request")
            case .unexpectedBody:
                return NSLocalizedString("There was a problem with your input. Please change and try again.", comment: "Unexpected Input")
            case .httpError:
                return NSLocalizedString("The web service returned a unknown error.", comment: "HTTP Error")
            case .unexpectedResponse:
                return NSLocalizedString("The web service returned unexpected data.", comment: "Unexpected Response Data")
            case .jsonParsingError:
                return NSLocalizedString("The web service response could not be parsed.", comment: "JSON Parsing Error")
            case .stringParsingError:
                return NSLocalizedString("The web service response could not be parsed.", comment: "String Parsing Error")
            case .unauthorized:
                return NSLocalizedString("Unauthorized, please login again.", comment: "Unauthorized")
            case .forbidden:
                return NSLocalizedString("You have not granted this app permission to access this data.", comment: "Forbidden")
            case .noNetwork:
                return NSLocalizedString("A network connection could not be established. Please try again when you have a sufficient internet connection.", comment: "No Network")
            }
        }
        
        
        /// A debug description that contains the error type
        var debugDescription: String {
            switch self {
            case .invalidRequest:
                return NSLocalizedString("DEBUG (invalidRequest): The request could not be formed. Check for any invalid data or url.", comment: "DEBUG Invalid Request")
            case .unexpectedBody:
                return NSLocalizedString("DEBUG (unexpectedBody): The request body could not be formed. Check for any invalid input.", comment: "DEBUG Unexpected Input")
            case .httpError:
                return NSLocalizedString("DEBUG (httpError): The web service returned a unknown error, like a 500.", comment: "DEBUG HTTP Error")
            case .unexpectedResponse:
                return NSLocalizedString("DEBUG (unexpectedResponse): The response data did not have the expected format, value, or type.", comment: "DEBUG Unexpected Response Data")
            case .jsonParsingError:
                return NSLocalizedString("DEBUG (jsonParsingError): The data could not be read.", comment: "DEBUG JSON Parsing Error")
            case .stringParsingError:
                return NSLocalizedString("DEBUG (stringParsingError): The data could not be read.", comment: "DEBUG String Parsing Error")
            case .unauthorized:
                return NSLocalizedString("DEBUG (unauthorized): Unauthorized, please login again.", comment: "DEBUG Unauthorized")
            case .forbidden:
                return NSLocalizedString("DEBUG (forbidden): You have not granted this app permission to access this data.", comment: "DEBUG Forbidden")
            case .noNetwork:
                return NSLocalizedString("DEBUG (noNetwork): A network connection could not be established.", comment: "DEBUG No Network")
            }
        }
        
        
        /// Code from the custom ErrorType
        var code: Int {
            switch self {
            case .unauthorized:
                return 401
            case .forbidden:
                return 403
            case .httpError:
                return 599
            default:
                return 499
            }
        }
    }
    
    /// Custom ErrorType for common errors experienced with web service calls
    public let type: ErrorType
    /// The error code returned from a web service, or the code from a custom ErrorType
    public let code: Int?
    /// The description returned from a web service, or the description from a custom ErrorType
    public let message: String
    
    public var legacyError: NSError {
        return NSError(domain: "UHIError", code: type.code, userInfo: [NSLocalizedDescriptionKey: type.description])
    }
    
    /// Creates a UHIError
    /// - important: This init is typically reserved for web service responses. For predefined UHIErrors, use init(type:).
    public init(type: ErrorType, code: Int?, description: String?) {
        self.type = type
        self.code = code
        self.message = description ?? type.description
    }
    
    /// Creates a UHIError for custom types with predefined descriptions and codes
    public convenience init(type: ErrorType) {
        self.init(type: type, code: type.code, description: type.description)
    }
    
    /// Creates a UHIError from an NSError
    public convenience init(from nsError: NSError) {
        self.init(type: .httpError, code: nsError.code, description: nsError.localizedDescription)
    }
}
