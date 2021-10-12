//
//  XCTest+.swift
//  
//
//  Created by Christopher Jennewein on 10/11/21.
//

import XCTest


extension XCTest {
    @available(iOS 15.0, *)
    /// Asserts the closure will throw an error
    /// - Important: This function is temporary until XCTAssertThrowsError supports async closures natively
    func XCTAssertThrowsError<T: Codable>(_ expression: @autoclosure () async throws -> T,
                                          _ message: @autoclosure () -> String = "The closure did not throw an error",
                                          file: StaticString = #filePath,
                                          line: UInt = #line,
                                          _ errorHandler: (_ error: Error) -> Void = { _ in }) async {
        do {
            _ = try await expression()
            XCTFail(message(), file: file, line: line)
        } catch {
            errorHandler(error)
        }
    }
}
