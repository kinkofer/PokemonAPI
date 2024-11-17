//
//  ResourceServiceTests.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 7/12/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import XCTest
@testable import PokemonAPI


@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class ResourceServiceTests: XCTestCase {
    typealias API = ResourceService.API
    typealias Mock = RequestMocking.MockedResponse
    
    var service: ResourceService!

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testFetchResource_success() async throws {
        try mock(.fetchResource(MockResourceData.berryResource), result: .success(MockBerryData.berry))
        
        do {
            let berry = try await service.fetch(MockResourceData.berryResource)
            do {
                let berryName = try XCTUnwrap(berry.name, "The berry should have a name")
                XCTAssertTrue(berryName == "cheri", "Expected the first berry to be cheri but found \(berryName)")
            } catch {
                XCTFail("The response was not valid")
            }
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
}
