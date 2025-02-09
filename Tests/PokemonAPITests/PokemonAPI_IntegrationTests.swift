//
//  PokemonAPITests.swift
//  PokemonAPITests
//
//  Created by Yeung Yiu Hung on 7/8/2016.
//  Copyright © 2016年 Yeung Yiu Hung. All rights reserved.
//

import XCTest
import PokemonAPI


class PokemonAPITests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testFetchBerries() async throws {
        let list = try await PokemonAPI().berryService.fetchBerryList()
        XCTAssertGreaterThan(list.count ?? -1, 0)
    }
    
    
    func testFetchBerryInfo() async throws {
        let obj = try await PokemonAPI().berryService.fetchBerry(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchEvolutionChain() async throws {
        let list = try await PokemonAPI().evolutionService.fetchEvolutionChainList()
        XCTAssertGreaterThan(list.count ?? -1, 0)
    }
    
    
    func testFetchEvolution() async throws {
        let obj = try await PokemonAPI().evolutionService.fetchEvolutionChain(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchVersionGroup() async throws {
        let obj = try await PokemonAPI().gameService.fetchVersionGroup(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchItem() async throws {
        let obj = try await PokemonAPI().itemService.fetchItem(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchItemAttr() async throws {
        let obj = try await PokemonAPI().itemService.fetchItemAttribute(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchItemCategory() async throws {
        let obj = try await PokemonAPI().itemService.fetchItemCategory(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchItemFlingEffect() async throws {
        let obj = try await PokemonAPI().itemService.fetchItemFlingEffect(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchItemPocket() async throws {
        let obj = try await PokemonAPI().itemService.fetchItemPocket(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchMachine() async throws {
        let obj = try await PokemonAPI().machineService.fetchMachine(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    
    func testFetchMove() async throws {
        let obj = try await PokemonAPI().moveService.fetchMove(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchMoveAilment() async throws {
        let obj = try await PokemonAPI().moveService.fetchMoveAilment(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchMoveBattleStyle() async throws {
        let obj = try await PokemonAPI().moveService.fetchMoveBattleStyle(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchMoveCategory() async throws {
        let obj = try await PokemonAPI().moveService.fetchMoveCategory(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchMoveDamageClass() async throws {
        let obj = try await PokemonAPI().moveService.fetchMoveDamageClass(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchMoveLearnMethod() async throws {
        let obj = try await PokemonAPI().moveService.fetchMoveLearnMethod(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchMoveTarget() async throws {
        let obj = try await PokemonAPI().moveService.fetchMoveTarget(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchLocation() async throws {
        let obj = try await PokemonAPI().locationService.fetchLocation(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchLocationArea() async throws {
        let obj = try await PokemonAPI().locationService.fetchLocationArea(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPalPark() async throws {
        let obj = try await PokemonAPI().locationService.fetchPalParkArea(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchRegion() async throws {
        let obj = try await PokemonAPI().locationService.fetchRegion(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchAbility() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchAbility(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchCharacteristic() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchCharacteristic(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchEggGroup() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchEggGroup(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchGender() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchGender(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchGrowthRate() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchGrowthRate(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchNature() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchNature("2")
        XCTAssertEqual(obj.id, 2)
    }
    
    func testFetchPokeathlonStat() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchPokeathlonStat(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPokemon() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchPokemon(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPokemonColor() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchPokemonColor(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPokemonForm() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchPokemonForm(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPokemonHabitat() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchPokemonHabitat(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPokemonShape() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchPokemonShape(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPokemonSpecies() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchPokemonSpecies(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testFetchPokemonStat() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchStat("2")
        XCTAssertEqual(obj.id, 2)
    }
    
    func testFetchPokemonType() async throws {
        let obj = try await PokemonAPI().pokemonService.fetchType(1)
        XCTAssertEqual(obj.id, 1)
    }
    
    func testLanguage() async throws {
        let obj = try await PokemonAPI().utilityService.fetchLanguage(1)
        XCTAssertEqual(obj.id, 1)
    }
}

