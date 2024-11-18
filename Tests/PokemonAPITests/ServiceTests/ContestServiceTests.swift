//
//  ContestServiceTests.swift
//  
//
//  Created by Christopher Jennewein on 10/11/21.
//

import XCTest
@testable import PokemonAPI


@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
class ContestServiceTests: XCTestCase {
    typealias API = ContestService.API
    typealias Mock = RequestMocking.MockedResponse
    
    var service: ContestService!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = ContestService(session: .mockedResponsesOnly)
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
    
    func testFetchContestTypeList_createUrl_success() async throws {
        let paginationState: PaginationState<PKMContestType> = .initial(pageLimit: 5)
        let url = try XCTUnwrap(API.fetchContestTypeList.createUrl(baseURL: service.baseURL, paginationState: paginationState), "The url should be created")
        
        let targetUrl = URL(string: "https://pokeapi.co/api/v2/contest-type?limit=5&offset=0")!
        XCTAssertTrue(targetUrl.compareComponents(url))
    }
    
    
    func testFetchContestTypeList_success() async throws {
        let paginationState: PaginationState<PKMContestType> = .initial(pageLimit: 5)
        try mock(.fetchContestTypeList, paginationState: paginationState, result: .success(MockContestData.contestTypeList))
        
        let pagedObject = try await service.fetchContestTypeList(paginationState: .initial(pageLimit: 5))
        let count = try XCTUnwrap(pagedObject.count, "The PKMPagedObject should have a count")
        let contestType = try XCTUnwrap(pagedObject.results?.first as? PKMNamedAPIResource, "The first result should be a named resource of a contest type")
        let contestTypeName = try XCTUnwrap(contestType.name, "The contest type should have a name")

        XCTAssertEqual(pagedObject.count, 5, "Expected to find 5 contest types but found \(count)")
        XCTAssertEqual(contestTypeName, "cool", "Expected the first contest type to be cool but found \(contestTypeName)")
    }
    
    
    func testFetchContestType_success() async throws {
        try mock(.fetchContestTypeByID(1), result: .success(MockContestData.contestType))
        
        let contestType = try await service.fetchContestType(1)
        
        let name = try XCTUnwrap(contestType.name, "The PKMContestType should have a name")
        XCTAssertEqual(name, "cool", "Expected the contest type name to be cool but found \(name)")
    }
    
    
    func testFetchContestType_failure() async throws {
        let testError = HTTPError.unexpectedResponse
        try mock(.fetchContestTypeByID(1), result: .failure(testError), httpCode: HTTPError.unexpectedResponse.code)
        
        await XCTAssertThrowsError(try await service.fetchContestType(1), testError)
    }
}
