//
//  ResourceServiceTests.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 7/12/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import XCTest
import Combine
@testable import PokemonAPI


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
class ResourceServiceTests: XCTestCase {
    typealias API = ResourceService.API
    typealias Mock = RequestMocking.MockedResponse
    
    var service: ResourceService!
    var cancellables = Set<AnyCancellable>()

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancellables = Set<AnyCancellable>()
        service = ResourceService(session: .mockedResponsesOnly)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        RequestMocking.removeAllMocks()
    }

    
    
    // MARK: - Helper
    
    private func mock<T>(_ apiCall: API<T>, result: Result<Data, Swift.Error>, httpCode: Int = 200, paginated: Bool = false) throws {
        let mock = try Mock(apiCall: apiCall, baseURL: service.baseURL, result: result, httpCode: httpCode)
        RequestMocking.add(mock: mock)
    }
    
    
    
    // MARK: - Tests
    
    func testFetchResource_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        try mock(.fetchResource(MockResourceData.berryResource), result: .success(MockBerryData.berry))
        
        service.fetch(MockResourceData.berryResource)
            .sinkToResult { result in
                switch result {
                case .success(let berry):
                    do {
                        let berryName = try XCTUnwrap(berry.name, "The berry should have a name")
                        XCTAssertTrue(berryName == "cheri", "Expected the first berry to be cheri but found \(berryName)")
                    } catch {
                        XCTFail("The response was not valid")
                    }
                case .failure(let error):
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
}
