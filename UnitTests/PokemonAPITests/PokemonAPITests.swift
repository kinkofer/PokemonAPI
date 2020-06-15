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
    
    
    
    func testFetchBerries() {
        let asyncExpectation = expectation(description: "Fetch berries")
        
        PokemonAPI.berryService.fetchBerryList() { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    
    func testFetchBerryInfo() {
        let asyncExpectation = expectation(description: "Fetch berries")
        PokemonAPI.berryService.fetchBerry(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchEvolutionChain() {
        let asyncExpectation = expectation(description: "Fetch Evo Chains")
        PokemonAPI.evolutionService.fetchEvolutionChainList() { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchEvolution() {
        let asyncExpectation = expectation(description: "Fetch Evo Chain")
        PokemonAPI.evolutionService.fetchEvolutionChain(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchVersionGroup() {
        let asyncExpectation = expectation(description: "Fetch Version Group")
        PokemonAPI.gameService.fetchVersionGroup(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItem() {
        let asyncExpectation = expectation(description: "Fetch Item")
        PokemonAPI.itemService.fetchItem(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemAttr() {
        let asyncExpectation = expectation(description: "Fetch Item Attr")
        PokemonAPI.itemService.fetchItemAttribute(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemCategory() {
        let asyncExpectation = expectation(description: "Fetch Item Category")
        PokemonAPI.itemService.fetchItemCategory(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemFlingEffect() {
        let asyncExpectation = expectation(description: "Fetch Item Fling Effect")
        PokemonAPI.itemService.fetchItemFlingEffect(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemPocket() {
        let asyncExpectation = expectation(description: "Fetch Item Pocket")
        PokemonAPI.itemService.fetchItemPocket(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    
    func testFetchMachine() {
        let asyncExpectation = expectation(description: "Fetch Machine")
        PokemonAPI.machineService.fetchMachine(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    
    func testFetchMove() {
        let asyncExpectation = expectation(description: "Fetch Move")
        PokemonAPI.moveService.fetchMove(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveAilment() {
        let asyncExpectation = expectation(description: "Fetch Move Ailment")
        PokemonAPI.moveService.fetchMoveAilment(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveBattleStyle() {
        let asyncExpectation = expectation(description: "Fetch Move Battle Style")
        PokemonAPI.moveService.fetchMoveBattleStyle(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveCategory() {
        let asyncExpectation = expectation(description: "Fetch move category")
        PokemonAPI.moveService.fetchMoveCategory(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveDamageClass() {
        let asyncExpectation = expectation(description: "Fetch move damage class")
        PokemonAPI.moveService.fetchMoveDamageClass(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveLearnMethod() {
        let asyncExpectation = expectation(description: "Fetch move learn method")
        PokemonAPI.moveService.fetchMoveLearnMethod(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveTarget() {
        let asyncExpectation = expectation(description: "Fetch move target")
        PokemonAPI.moveService.fetchMoveTarget(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchLocation() {
        let asyncExpectation = expectation(description: "Fetch location")
        PokemonAPI.locationService.fetchLocation(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchLocationArea() {
        let asyncExpectation = expectation(description: "Fetch location area")
        PokemonAPI.locationService.fetchLocationArea(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPalPark() {
        let asyncExpectation = expectation(description: "Fetch pal park area")
        PokemonAPI.locationService.fetchPalParkArea(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchRegion() {
        let asyncExpectation = expectation(description: "Fetch Region")
        PokemonAPI.locationService.fetchRegion(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchAbility() {
        let asyncExpectation = expectation(description: "Fetch Ability")
        PokemonAPI.pokemonService.fetchAbility(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchCharacteristic() {
        let asyncExpectation = expectation(description: "Fetch Ability")
        PokemonAPI.pokemonService.fetchCharacteristic(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchEggGroup() {
        let asyncExpectation = expectation(description: "Fetch Egg Group")
        PokemonAPI.pokemonService.fetchEggGroup(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchGender() {
        let asyncExpectation = expectation(description: "Fetch Gender")
        PokemonAPI.pokemonService.fetchGender(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchGrowthRate() {
        let asyncExpectation = expectation(description: "Fetch Growth Rate")
        PokemonAPI.pokemonService.fetchGrowthRate(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchNature() {
        let asyncExpectation = expectation(description: "Fetch Nature")
        PokemonAPI.pokemonService.fetchNature("2") { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokeathlonStat() {
        let asyncExpectation = expectation(description: "Fetch Pokeathlon Stat")
        PokemonAPI.pokemonService.fetchPokeathlonStat(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemon() {
        let asyncExpectation = expectation(description: "Fetch Pokemon")
        PokemonAPI.pokemonService.fetchPokemon(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonColor() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Color")
        PokemonAPI.pokemonService.fetchPokemonColor(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonForm() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Form")
        PokemonAPI.pokemonService.fetchPokemonForm(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonHabitat() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Habitat")
        PokemonAPI.pokemonService.fetchPokemonHabitat(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonShape() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Shape")
        PokemonAPI.pokemonService.fetchPokemonShape(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonSpecies() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Species")
        PokemonAPI.pokemonService.fetchPokemonSpecies(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonStat() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Stat")
        PokemonAPI.pokemonService.fetchStat("2") { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonType() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Type")
        PokemonAPI.pokemonService.fetchType(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testLanguage() {
        let asyncExpectation = expectation(description: "Fetch Language")
        PokemonAPI.utilityService.fetchLanguage(1) { result in
            if case let .failure(error) = result {
                XCTFail("The service should not fail: \(error.localizedDescription)")
            }
            asyncExpectation.fulfill();
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
}

