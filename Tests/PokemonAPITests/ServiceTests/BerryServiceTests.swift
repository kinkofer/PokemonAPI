//
//  BerryServiceTests.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import XCTest
@testable import PokemonAPI


@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class BerryServiceTests: XCTestCase {
    typealias API = BerryService.API
    typealias Mock = RequestMocking.MockedResponse
    
    var service: BerryService!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = BerryService(session: .mockedResponsesOnly)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        RequestMocking.removeAllMocks()
    }
    
    
    
    // MARK: - Helper
    
    private func mock(_ apiCall: API, result: Result<Data, Swift.Error>, httpCode: Int = 200, paginated: Bool = false) throws {
        let mock = try Mock(apiCall: apiCall, baseURL: service.baseURL, result: result, httpCode: httpCode)
        RequestMocking.add(mock: mock)
    }
    
    private func mock<T>(_ apiCall: API, paginationState: PaginationState<T>, result: Result<Data, Swift.Error>, httpCode: Int = 200, paginated: Bool = false) throws where T: Codable {
        let mock = try Mock(apiCall: apiCall, baseURL: service.baseURL, paginationState: paginationState, result: result, httpCode: httpCode)
        RequestMocking.add(mock: mock)
    }
    
    
    
    // MARK: - Tests
    
    func testFetchBerryList_success() async throws {
        let paginationState: PaginationState<PKMBerry> = .initial(pageLimit: 20)
        try mock(.fetchBerryList, paginationState: paginationState, result: .success(MockBerryData.berryList))
        
        do {
            let pagedObject = try await service.fetchBerryList()
            do {
                let count = try XCTUnwrap(pagedObject.count, "The PKMPagedObject should have a count")
                let berry = try XCTUnwrap(pagedObject.results?.first as? PKMNamedAPIResource, "The first result should be a named resource of a berry")
                let berryName = try XCTUnwrap(berry.name, "The berry should have a name")
                
                XCTAssertTrue(pagedObject.count == 64, "Expected to find 64 berries but found \(count)")
                XCTAssertTrue(berryName == "cheri", "Expected the first berry to be cheri but found \(berryName)")
            } catch {
                XCTFail("The response was not valid")
            }
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryList_failure() async throws {
        let paginationState: PaginationState<PKMBerry> = .initial(pageLimit: 20)
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryList, paginationState: paginationState, result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerryList()
            XCTFail("The service should fail")
        } catch {
            XCTAssertTrue(error.localizedDescription == testError.localizedDescription)
        }
    }
    
    
    func testFetchBerryByID_success() async throws {
        try mock(.fetchBerryByID(1), result: .success(MockBerryData.berry))
        
        do {
            let result = try await service.fetchBerry(1)
            XCTAssert(result.name == "cheri")
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryByID_failure() async throws {
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryByID(1), result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerry(1)
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription)
        }
    }
    
    
    func testFetchBerryByName_success() async throws {
        try mock(.fetchBerryByName("cheri"), result: .success(MockBerryData.berry))
        
        do {
            let result = try await service.fetchBerry("cheri")
            XCTAssert(result.name == "cheri")
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryByName_failure() async throws {
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryByName("cheri"), result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerry("cheri")
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription)
        }
    }
    
    
    func testFetchBerryFirmnessList_success() async throws {
        let paginationState: PaginationState<PKMBerryFirmness> = .initial(pageLimit: 20)
        try mock(.fetchBerryFirmnessList, paginationState: paginationState, result: .success(MockBerryData.berryFirmnessList))
        
        do {
            let pagedObject = try await service.fetchBerryFirmnessList()
            do {
                let count = try XCTUnwrap(pagedObject.count, "The PKMPagedObject should have a count")
                let berryFirmness = try XCTUnwrap(pagedObject.results?.first as? PKMNamedAPIResource, "The first result should be a named resource of a berry firmness")
                let berryFirmnessName = try XCTUnwrap(berryFirmness.name, "The berry firmness should have a name")
                
                XCTAssertTrue(count == 5, "Expected 5 berry firmness count but found \(count)")
                XCTAssertTrue(berryFirmnessName == "very-soft")
            } catch {
                XCTFail("The response was not valid")
            }
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryFirmnessList_failure() async throws {
        let paginationState: PaginationState<PKMBerryFirmness> = .initial(pageLimit: 20)
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFirmnessList, paginationState: paginationState, result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerryFirmnessList()
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription, "Expected error description \"\(testError.localizedDescription)\" but found \"\(error.localizedDescription)\"")
        }
    }
    
    
    func testFetchBerryFirmnessByID_success() async throws {
        try mock(.fetchBerryFirmnessByID(1), result: .success(MockBerryData.berryFirmness))
        
        do {
            let result = try await service.fetchBerryFirmness(1)
            XCTAssert(result.name == "very-soft")
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryFirmnessByID_failure() async throws {
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFirmnessByID(1), result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerryFirmness(1)
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription)
        }
    }
    
    
    func testFetchBerryFirmnessByName_success() async throws {
        try mock(.fetchBerryFirmnessByName("very-soft"), result: .success(MockBerryData.berryFirmness))
        
        do {
            let result = try await service.fetchBerryFirmness("very-soft")
            XCTAssert(result.name == "very-soft")
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryFirmnessByName_failure() async throws {
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFirmnessByName("very-soft"), result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerryFirmness("very-soft")
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription)
        }
    }
    
    
    func testFetchBerryFlavorList_success() async throws {
        let paginationState: PaginationState<PKMBerryFlavor> = .initial(pageLimit: 20)
        try mock(.fetchBerryFlavorList, paginationState: paginationState, result: .success(MockBerryData.berryFlavorList))
        
        do {
            let pagedObject = try await service.fetchBerryFlavorList()
            do {
                let count = try XCTUnwrap(pagedObject.count, "The PKMPagedObject should have a count")
                let berryFlavor = try XCTUnwrap(pagedObject.results?.first as? PKMNamedAPIResource, "The first result should be a named resource of a berry flavor")
                let berryFlavorName = try XCTUnwrap(berryFlavor.name, "The berry flavor should have a name")
                
                XCTAssertTrue(count == 5, "Expected 5 berry flavors count but found \(count)")
                XCTAssertTrue(berryFlavorName == "spicy")
            } catch {
                XCTFail("The response was not valid")
            }
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryFlavor_failure() async throws {
        let paginationState: PaginationState<PKMBerryFlavor> = .initial(pageLimit: 20)
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFlavorList, paginationState: paginationState, result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerryFlavorList()
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription, "Expected error description \"\(testError.localizedDescription)\" but found \"\(error.localizedDescription)\"")
        }
    }
    
    
    func testFetchBerryFlavorByID_success() async throws {
        try mock(.fetchBerryFlavorByID(1), result: .success(MockBerryData.berryFlavor))
        
        do {
            let result = try await service.fetchBerryFlavor(1)
            XCTAssert(result.name == "spicy")
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryFlavorByID_failure() async throws {
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFlavorByID(1), result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerryFlavor(1)
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription)
        }
    }
    
    
    func testFetchBerryFlavorByName_success() async throws {
        try mock(.fetchBerryFlavorByName("spicy"), result: .success(MockBerryData.berryFlavor))
        
        do {
            let result = try await service.fetchBerryFlavor("spicy")
            XCTAssert(result.name == "spicy")
        } catch {
            XCTFail("The service should not fail: \(error.localizedDescription)")
        }
    }
    
    
    func testFetchBerryFlavorByName_failure() async throws {
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFlavorByName("spicy"), result: testResult, httpCode: testError.code)
        
        do {
            _ = try await service.fetchBerryFlavor("spicy")
            XCTFail("The service should fail")
        } catch {
            XCTAssert(error.localizedDescription == testError.localizedDescription)
        }
    }
}
