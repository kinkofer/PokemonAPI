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
        
        PokemonKit.fetchBerryList() { result in
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
        PokemonKit.fetchBerry("1") { result in
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
        PokemonKit.fetchEvolutionChain("1") { result in
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
        PokemonKit.fetchVersionGroup("1") { result in
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
        PokemonKit.fetchItem("1") { result in
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
        PokemonKit.fetchItemAttribute("1") { result in
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
        PokemonKit.fetchItemCategory("1") { result in
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
        PokemonKit.fetchItemFlingEffect("1") { result in
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
        PokemonKit.fetchItemPocket("1") { result in
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
        PokemonKit.fetchMove("1") { result in
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
        PokemonKit.fetchMoveAilment("1") { result in
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
        PokemonKit.fetchMoveBattleStyle("1") { result in
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
        PokemonKit.fetchMoveCategory("1") { result in
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
        PokemonKit.fetchMoveDamageClass("1") { result in
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
        PokemonKit.fetchMoveLearnMethod("1") { result in
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
        PokemonKit.fetchMoveTarget("1") { result in
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
        PokemonKit.fetchLocation("1") { result in
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
        PokemonKit.fetchLocationArea("1") { result in
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
        PokemonKit.fetchPalParkArea("1") { result in
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
        PokemonKit.fetchRegion("1") { result in
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
        PokemonKit.fetchAbility("1") { result in
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
        PokemonKit.fetchCharacteristic("1") { result in
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
        PokemonKit.fetchEggGroup("1") { result in
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
        PokemonKit.fetchGender("1") { result in
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
        PokemonKit.fetchGrowthRate("1") { result in
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
        PokemonKit.fetchNature("2") { result in
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
        PokemonKit.fetchPokeathlonStat("1") { result in
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
        PokemonKit.fetchPokemon("1") { result in
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
        PokemonKit.fetchPokemonColor("1") { result in
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
        PokemonKit.fetchPokemonForm("1") { result in
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
        PokemonKit.fetchPokemonHabitat("1") { result in
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
        PokemonKit.fetchPokemonShape("1") { result in
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
        PokemonKit.fetchPokemonSpecies("1") { result in
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
        PokemonKit.fetchStat("2") { result in
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
        PokemonKit.fetchType("1") { result in
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
        PokemonKit.fetchLanguage("1") { result in
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

