//
//  PokemonAPICombineTests.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import XCTest
import Combine
import PokemonAPI


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
class PokemonAPICombineTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testFetchBerries_Combine() {
        let asyncExpectation = expectation(description: "Fetch berries")
        
        PokemonAPI.berryService.fetchBerryList()
            .sinkToResult { result in
                if case let .failure(error) = result {
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
}
