//
//  BerryServiceTests.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/14/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import XCTest
import Combine
@testable import PokemonAPI


@available(OSX 10.15, iOS 13, tvOS 13.0, watchOS 6.0, *)
class BerryServiceTests: XCTestCase {
    typealias API = BerryService.API
    typealias Mock = RequestMocking.MockedResponse
    
    var service: BerryService!
    var cancellables = Set<AnyCancellable>()
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cancellables = Set<AnyCancellable>()
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
    
    func testFetchBerryList_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let paginationState: PaginationState<PKMBerry> = .initial(pageLimit: 20)
        try mock(.fetchBerryList, paginationState: paginationState, result: .success(MockBerryData.berryList))
        
        service.fetchBerryList()
            .sinkToResult { result in
                switch result {
                case .success(let pagedObject):
                    do {
                        let count = try XCTUnwrap(pagedObject.count, "The PKMPagedObject should have a count")
                        let berry = try XCTUnwrap(pagedObject.results?.first as? PKMNamedAPIResource, "The first result should be a named resource of a berry")
                        let berryName = try XCTUnwrap(berry.name, "The berry should have a name")
                        
                        XCTAssertTrue(pagedObject.count == 64, "Expected to find 64 berries but found \(count)")
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
    
    
    func testFetchBerryList_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let paginationState: PaginationState<PKMBerry> = .initial(pageLimit: 20)
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryList, paginationState: paginationState, result: testResult, httpCode: testError.code)
        
        service.fetchBerryList()
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssertTrue(error.localizedDescription == testError.localizedDescription)
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryByID_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        try mock(.fetchBerryByID(1), result: .success(MockBerryData.berry))
        
        service.fetchBerry(1)
            .sinkToResult { result in
                switch result {
                case .success(let result):
                    XCTAssert(result.name == "cheri")
                case .failure(let error):
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryByID_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryByID(1), result: testResult, httpCode: testError.code)
        
        service.fetchBerry(1)
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription)
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryByName_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        try mock(.fetchBerryByName("cheri"), result: .success(MockBerryData.berry))
        
        service.fetchBerry("cheri")
            .sinkToResult { result in
                switch result {
                case .success(let result):
                    XCTAssert(result.name == "cheri")
                case .failure(let error):
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryByName_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryByName("cheri"), result: testResult, httpCode: testError.code)
        
        service.fetchBerry("cheri")
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription)
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFirmnessList_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let paginationState: PaginationState<PKMBerryFirmness> = .initial(pageLimit: 20)
        try mock(.fetchBerryFirmnessList, paginationState: paginationState, result: .success(MockBerryData.berryFirmnessList))
        
        service.fetchBerryFirmnessList()
            .sinkToResult { result in
                switch result {
                case .success(let pagedObject):
                    do {
                        let count = try XCTUnwrap(pagedObject.count, "The PKMPagedObject should have a count")
                        let berryFirmness = try XCTUnwrap(pagedObject.results?.first as? PKMNamedAPIResource, "The first result should be a named resource of a berry firmness")
                        let berryFirmnessName = try XCTUnwrap(berryFirmness.name, "The berry firmness should have a name")
                        
                        XCTAssertTrue(count == 5, "Expected 5 berry firmness count but found \(count)")
                        XCTAssertTrue(berryFirmnessName == "very-soft")
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
    
    
    func testFetchBerryFirmnessList_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let paginationState: PaginationState<PKMBerryFirmness> = .initial(pageLimit: 20)
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFirmnessList, paginationState: paginationState, result: testResult, httpCode: testError.code)
        
        service.fetchBerryFirmnessList()
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription, "Expected error description \"\(testError.localizedDescription)\" but found \"\(error.localizedDescription)\"")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFirmnessByID_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        try mock(.fetchBerryFirmnessByID(1), result: .success(MockBerryData.berryFirmness))
        
        service.fetchBerryFirmness(1)
            .sinkToResult { result in
                switch result {
                case .success(let result):
                    XCTAssert(result.name == "very-soft")
                case .failure(let error):
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFirmnessByID_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFirmnessByID(1), result: testResult, httpCode: testError.code)
        
        service.fetchBerryFirmness(1)
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription)
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFirmnessByName_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        try mock(.fetchBerryFirmnessByName("very-soft"), result: .success(MockBerryData.berryFirmness))
        
        service.fetchBerryFirmness("very-soft")
            .sinkToResult { result in
                switch result {
                case .success(let result):
                    XCTAssert(result.name == "very-soft")
                case .failure(let error):
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFirmnessByName_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFirmnessByName("very-soft"), result: testResult, httpCode: testError.code)
        
        service.fetchBerryFirmness("very-soft")
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription)
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFlavorList_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let paginationState: PaginationState<PKMBerryFlavor> = .initial(pageLimit: 20)
        try mock(.fetchBerryFlavorList, paginationState: paginationState, result: .success(MockBerryData.berryFlavorList))
        
        service.fetchBerryFlavorList()
            .sinkToResult { result in
                switch result {
                case .success(let pagedObject):
                    do {
                        let count = try XCTUnwrap(pagedObject.count, "The PKMPagedObject should have a count")
                        let berryFlavor = try XCTUnwrap(pagedObject.results?.first as? PKMNamedAPIResource, "The first result should be a named resource of a berry flavor")
                        let berryFlavorName = try XCTUnwrap(berryFlavor.name, "The berry flavor should have a name")
                        
                        XCTAssertTrue(count == 5, "Expected 5 berry flavors count but found \(count)")
                        XCTAssertTrue(berryFlavorName == "spicy")
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
    
    
    func testFetchBerryFlavor_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let paginationState: PaginationState<PKMBerryFlavor> = .initial(pageLimit: 20)
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFlavorList, paginationState: paginationState, result: testResult, httpCode: testError.code)
        
        service.fetchBerryFlavorList()
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription, "Expected error description \"\(testError.localizedDescription)\" but found \"\(error.localizedDescription)\"")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFlavorByID_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        try mock(.fetchBerryFlavorByID(1), result: .success(MockBerryData.berryFlavor))
        
        service.fetchBerryFlavor(1)
            .sinkToResult { result in
                switch result {
                case .success(let result):
                    XCTAssert(result.name == "spicy")
                case .failure(let error):
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFlavorByID_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFlavorByID(1), result: testResult, httpCode: testError.code)
        
        service.fetchBerryFlavor(1)
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription)
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFlavorByName_success() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        try mock(.fetchBerryFlavorByName("spicy"), result: .success(MockBerryData.berryFlavor))
        
        service.fetchBerryFlavor("spicy")
            .sinkToResult { result in
                switch result {
                case .success(let result):
                    XCTAssert(result.name == "spicy")
                case .failure(let error):
                    XCTFail("The service should not fail: \(error.localizedDescription)")
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
    
    
    func testFetchBerryFlavorByName_failure() throws {
        let asyncExpectation = expectation(description: "Completion")
        
        let testError = HTTPError.unexpectedResponse
        let testResult: Result<Data, Error> = .failure(testError)
        try mock(.fetchBerryFlavorByName("spicy"), result: testResult, httpCode: testError.code)
        
        service.fetchBerryFlavor("spicy")
            .sinkToResult { result in
                switch result {
                case .success:
                    XCTFail("The service should fail")
                case .failure(let error):
                    XCTAssert(error.localizedDescription == testError.localizedDescription)
                }
                
                asyncExpectation.fulfill();
            }
            .store(in: &cancellables)
        
        self.wait(for: [asyncExpectation], timeout: 5)
    }
}
