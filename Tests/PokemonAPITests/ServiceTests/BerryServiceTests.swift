//
//  BerryServiceTests.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import XCTest
@testable import PokemonAPI


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
    
    private func mock(_ apiCall: API, result: Result<Data, Swift.Error>, httpCode: Int = 200) throws {
        let mock = try Mock(apiCall: apiCall, baseURL: service.baseURL, result: result, httpCode: httpCode)
        RequestMocking.add(mock: mock)
    }
    
    private func mock<T>(_ apiCall: API, paginationState: PaginationState<T>, result: Result<Data, Swift.Error>, httpCode: Int = 200) throws where T: Codable {
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
        try mock(.fetchBerryList, paginationState: paginationState, result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerryList(), testError)
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
        try mock(.fetchBerryByID(1), result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerry(1), testError)
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
        try mock(.fetchBerryByName("cheri"), result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerry("cheri"), testError)
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
        try mock(.fetchBerryFirmnessList, paginationState: paginationState, result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerryFirmnessList(), testError)
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
        try mock(.fetchBerryFirmnessByID(1), result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerryFirmness(1), testError)
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
        try mock(.fetchBerryFirmnessByName("very-soft"), result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerryFirmness("very-soft"), testError)
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
        try mock(.fetchBerryFlavorList, paginationState: paginationState, result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerryFlavorList(), testError)
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
        try mock(.fetchBerryFlavorByID(1), result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerryFlavor(1), testError)
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
        try mock(.fetchBerryFlavorByName("spicy"), result: .failure(testError), httpCode: testError.code)
        
        await XCTAssertThrowsError(try await service.fetchBerryFlavor("spicy"), testError)
    }
}
