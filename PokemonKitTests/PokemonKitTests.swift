//
//  PokemonKitTests.swift
//  PokemonKitTests
//
//  Created by Yeung Yiu Hung on 7/8/2016.
//  Copyright © 2016年 Yeung Yiu Hung. All rights reserved.
//

import XCTest
import PokemonKit

class PokemonKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }
    
    func testFetchingBerries() {
        let asyncExpectation = expectation(description: "Fetch berries")
        
        PokemonKit.berryService.fetchBerryList() { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
        
    }
    
    func testFectingBerryInfo() {
        let asyncExpectation = expectation(description: "Fetch berries")
        PokemonKit.berryService.fetchBerry("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchingEvolutionChain() {
        let asyncExpectation = expectation(description: "Fetch Evo Chains")
        PokemonKit.evolutionService.fetchEvolutionChainList() { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchingEvolution() {
        let asyncExpectation = expectation(description: "Fetch Evo Chain")
        PokemonKit.evolutionService.fetchEvolutionChain("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchVersionGroup() {
        let asyncExpectation = expectation(description: "Fetch Version Group")
        PokemonKit.gameService.fetchVersionGroup("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItem() {
        let asyncExpectation = expectation(description: "Fetch Item")
        PokemonKit.itemService.fetchItem("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemAttr() {
        let asyncExpectation = expectation(description: "Fetch Item Attr")
        PokemonKit.itemService.fetchItemAttribute("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemCategory() {
        let asyncExpectation = expectation(description: "Fetch Item Category")
        PokemonKit.itemService.fetchItemCategory("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemFlingEffect() {
        let asyncExpectation = expectation(description: "Fetch Item Fling Effect")
        PokemonKit.itemService.fetchItemFlingEffect("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchItemPocket() {
        let asyncExpectation = expectation(description: "Fetch Item Pocket")
        PokemonKit.itemService.fetchItemPocket("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    
    func testFetchMachine() {
        let asyncExpectation = expectation(description: "Fetch Machine")
        PokemonKit.machineService.fetchMachine("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    
    func testFetchMove() {
        let asyncExpectation = expectation(description: "Fetch Move")
        PokemonKit.moveService.fetchMove("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveAilment() {
        let asyncExpectation = expectation(description: "Fetch Move Ailment")
        PokemonKit.moveService.fetchMoveAilment("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveBattleStyle() {
        let asyncExpectation = expectation(description: "Fetch Move Battle Style")
        PokemonKit.moveService.fetchMoveBattleStyle("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveCategory() {
        let asyncExpectation = expectation(description: "Fetch move category")
        PokemonKit.moveService.fetchMoveCategory("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveDamageClass() {
        let asyncExpectation = expectation(description: "Fetch move damage class")
        PokemonKit.moveService.fetchMoveDamageClass("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveLearnMethod() {
        let asyncExpectation = expectation(description: "Fetch move learn method")
        PokemonKit.moveService.fetchMoveLearnMethod("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchMoveTarget() {
        let asyncExpectation = expectation(description: "Fetch move target")
        PokemonKit.moveService.fetchMoveTarget("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchLocation() {
        let asyncExpectation = expectation(description: "Fetch location")
        PokemonKit.locationService.fetchLocation("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchLocationArea() {
        let asyncExpectation = expectation(description: "Fetch location area")
        PokemonKit.locationService.fetchLocationArea("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPalPark() {
        let asyncExpectation = expectation(description: "Fetch pal park area")
        PokemonKit.locationService.fetchPalParkArea("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchRegion() {
        let asyncExpectation = expectation(description: "Fetch Region")
        PokemonKit.locationService.fetchRegion("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchAbility() {
        let asyncExpectation = expectation(description: "Fetch Ability")
        PokemonKit.pokemonService.fetchAbility("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchCharacteristic() {
        let asyncExpectation = expectation(description: "Fetch Ability")
        PokemonKit.pokemonService.fetchCharacteristic("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchEggGroup() {
        let asyncExpectation = expectation(description: "Fetch Egg Group")
        PokemonKit.pokemonService.fetchEggGroup("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchGender() {
        let asyncExpectation = expectation(description: "Fetch Gender")
        PokemonKit.pokemonService.fetchGender("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchGrowthRate() {
        let asyncExpectation = expectation(description: "Fetch Growth Rate")
        PokemonKit.pokemonService.fetchGrowthRate("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchNature() {
        let asyncExpectation = expectation(description: "Fetch Nature")
        PokemonKit.pokemonService.fetchNature("2") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokeathlonStat() {
        let asyncExpectation = expectation(description: "Fetch Pokeathlon Stat")
        PokemonKit.pokemonService.fetchPokeathlonStat("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemon() {
        let asyncExpectation = expectation(description: "Fetch Pokemon")
        PokemonKit.pokemonService.fetchPokemon("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonColor() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Color")
        PokemonKit.pokemonService.fetchPokemonColor("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonForm() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Form")
        PokemonKit.pokemonService.fetchPokemonForm("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonHabitat() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Habitat")
        PokemonKit.pokemonService.fetchPokemonHabitat("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonShape() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Shape")
        PokemonKit.pokemonService.fetchPokemonShape("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonSpecies() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Species")
        PokemonKit.pokemonService.fetchPokemonSpecies("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonStat() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Stat")
        PokemonKit.pokemonService.fetchStat("2") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testFetchPokemonType() {
        let asyncExpectation = expectation(description: "Fetch Pokemon Type")
        PokemonKit.pokemonService.fetchType("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
    
    func testLanguage() {
        let asyncExpectation = expectation(description: "Fetch Language")
        PokemonKit.utilityService.fetchLanguage("1") { result in
            switch result {
            case .success(_):
                asyncExpectation.fulfill()
            case .failure(let error):
                XCTFail("Should not failed with \(error.message)")
                asyncExpectation.fulfill();
            }
        }
        
        self.waitForExpectations(timeout: 30) { (err) -> Void in
            XCTAssertNil(err, "Something went wrong")
        }
    }
}

