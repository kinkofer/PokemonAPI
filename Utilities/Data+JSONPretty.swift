//
//  Data+JSONPretty.swift
//  Pods
//
//  Created by Christopher Jennewein on 6/26/18.
//

import Foundation


extension Data {
    func jsonPrettyPrinted() throws -> String? {
        let json = try JSONSerialization.jsonObject(with: self, options: [])
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        return String(data: jsonData, encoding: .utf8)
    }
}
