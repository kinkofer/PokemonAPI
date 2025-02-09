//
//  XCTest+.swift
//  
//
//  Created by Christopher Jennewein on 10/11/21.
//

import XCTest


extension XCTest {
    /// Asserts the closure will throw an error
    /// - Important: This function is temporary until XCTAssertThrowsError supports async closures natively
    /// - Note: Adapted from https://arturgruchala.com/testing-async-await-exceptions/
    func XCTAssertThrowsError<T, R>(_ expression: @autoclosure () async throws -> T,
                                    _ errorThrown: @autoclosure () -> R,
                                    _ message: @autoclosure () -> String = "The expression did not throw an error",
                                    file: StaticString = #filePath,
                                    line: UInt = #line,
                                    _ errorHandler: (_ error: Error) -> Void = { _ in }) async where T: Codable, R: Error & Equatable {
        do {
            _ = try await expression()
            XCTFail(message(), file: file, line: line)
        } catch {
            XCTAssertEqual(error as? R, errorThrown())
        }
    }
}
