//
//  URLResponse+.swift
//  UHIWebServices
//
//  Created by Chris Jennewein on 8/5/19.
//  Copyright © 2019 U-Haul International. All rights reserved.
//

import Foundation


extension HTTPURLResponse {
    public var httpStatus: HTTPStatus {
        return HTTPStatus(code: self.statusCode)
    }
}
