//
//  URLRequest+.swift
//  UHIWebServices
//
//  Created by Chris Jennewein on 10/10/19.
//  Copyright © 2019 U-Haul International. All rights reserved.
//

import Foundation


extension URLRequest {
    public mutating func addHeaders(_ headers: [String: String?]) {
        for (key, value) in headers {
            self.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    public mutating func addHeader(_ header: HTTPHeader) {
        self.addHeaders([header.key: header.value])
    }
    
    public mutating func addHeaders(_ headers: [HTTPHeader]) {
        let headersDict = Dictionary(headers.map { ($0.key, $0.value) }) { _, last in last }
        self.addHeaders(headersDict)
    }
}
