//
//  PokemonService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMPokemonService: HTTPWebService {
    func fetchAbilityList(paginationState: PaginationState<PKMAbility>) async throws -> PKMPagedObject<PKMAbility>
    func fetchAbility(_ abilityID: Int) async throws -> PKMAbility
    func fetchAbility(_ abilityName: String) async throws -> PKMAbility
    func fetchCharacteristicList(paginationState: PaginationState<PKMCharacteristic>) async throws -> PKMPagedObject<PKMCharacteristic>
    func fetchCharacteristic(_ characteristicID: Int) async throws -> PKMCharacteristic
    func fetchEggGroupList(paginationState: PaginationState<PKMEggGroup>) async throws -> PKMPagedObject<PKMEggGroup>
    func fetchEggGroup(_ eggGroupID: Int) async throws -> PKMEggGroup
    func fetchEggGroup(_ eggGroupName: String) async throws -> PKMEggGroup
    func fetchGenderList(paginationState: PaginationState<PKMGender>) async throws -> PKMPagedObject<PKMGender>
    func fetchGender(_ genderID: Int) async throws -> PKMGender
    func fetchGender(_ genderName: String) async throws -> PKMGender
    func fetchGrowthRateList(paginationState: PaginationState<PKMGrowthRate>) async throws -> PKMPagedObject<PKMGrowthRate>
    func fetchGrowthRate(_ growthRateID: Int) async throws -> PKMGrowthRate
    func fetchGrowthRate(_ growthRateName: String) async throws -> PKMGrowthRate
    func fetchNatureList(paginationState: PaginationState<PKMNature>) async throws -> PKMPagedObject<PKMNature>
    func fetchNature(_ natureID: Int) async throws -> PKMNature
    func fetchNature(_ natureName: String) async throws -> PKMNature
    func fetchPokeathlonStatList(paginationState: PaginationState<PKMPokeathlonStat>) async throws -> PKMPagedObject<PKMPokeathlonStat>
    func fetchPokeathlonStat(_ pokeathlonStatID: Int) async throws -> PKMPokeathlonStat
    func fetchPokeathlonStat(_ pokeathlonStatName: String) async throws -> PKMPokeathlonStat
    func fetchPokemonList(paginationState: PaginationState<PKMPokemon>) async throws -> PKMPagedObject<PKMPokemon>
    func fetchPokemon(_ pokemonID: Int) async throws -> PKMPokemon
    func fetchPokemon(_ pokemonName: String) async throws -> PKMPokemon
    func fetchPokemonColorList(paginationState: PaginationState<PKMPokemonColor>) async throws -> PKMPagedObject<PKMPokemonColor>
    func fetchPokemonColor(_ pokemonColorID: Int) async throws -> PKMPokemonColor
    func fetchPokemonColor(_ pokemonColorName: String) async throws -> PKMPokemonColor
    func fetchPokemonFormList(paginationState: PaginationState<PKMPokemonForm>) async throws -> PKMPagedObject<PKMPokemonForm>
    func fetchPokemonForm(_ pokemonFormID: Int) async throws -> PKMPokemonForm
    func fetchPokemonForm(_ pokemonFormName: String) async throws -> PKMPokemonForm
    func fetchPokemonHabitatList(paginationState: PaginationState<PKMPokemonHabitat>) async throws -> PKMPagedObject<PKMPokemonHabitat>
    func fetchPokemonHabitat(_ pokemonHabitatID: Int) async throws -> PKMPokemonHabitat
    func fetchPokemonHabitat(_ pokemonHabitatName: String) async throws -> PKMPokemonHabitat
    func fetchPokemonShapeList(paginationState: PaginationState<PKMPokemonShape>) async throws -> PKMPagedObject<PKMPokemonShape>
    func fetchPokemonShape(_ pokemonShapeID: Int) async throws -> PKMPokemonShape
    func fetchPokemonShape(_ pokemonShapeName: String) async throws -> PKMPokemonShape
    func fetchPokemonSpeciesList(paginationState: PaginationState<PKMPokemonSpecies>) async throws -> PKMPagedObject<PKMPokemonSpecies>
    func fetchPokemonSpecies(_ pokemonSpeciesID: Int) async throws -> PKMPokemonSpecies
    func fetchPokemonSpecies(_ pokemonSpeciesName: String) async throws -> PKMPokemonSpecies
    func fetchStatList(paginationState: PaginationState<PKMStat>) async throws -> PKMPagedObject<PKMStat>
    func fetchStat(_ statID: Int) async throws -> PKMStat
    func fetchStat(_ statName: String) async throws -> PKMStat
    func fetchTypeList(paginationState: PaginationState<PKMType>) async throws -> PKMPagedObject<PKMType>
    func fetchType(_ typeID: Int) async throws -> PKMType
    func fetchType(_ typeName: String) async throws -> PKMType
}



// MARK: - Web Services

public struct PokemonService: PKMPokemonService, Sendable {
    public enum API: APICall {
        case fetchAbilityList
        case fetchAbilityByID(Int)
        case fetchAbilityByName(String)
        case fetchCharacteristicList
        case fetchCharacteristic(Int)
        case fetchEggGroupList
        case fetchEggGroupByID(Int)
        case fetchEggGroupByName(String)
        case fetchGenderList
        case fetchGenderByID(Int)
        case fetchGenderByName(String)
        case fetchGrowthRateList
        case fetchGrowthRateByID(Int)
        case fetchGrowthRateByName(String)
        case fetchNatureList
        case fetchNatureByID(Int)
        case fetchNatureByName(String)
        case fetchPokeathlonStatList
        case fetchPokeathlonStatByID(Int)
        case fetchPokeathlonStatByName(String)
        case fetchPokemonList
        case fetchPokemonByID(Int)
        case fetchPokemonByName(String)
        case fetchPokemonColorList
        case fetchPokemonColorByID(Int)
        case fetchPokemonColorByName(String)
        case fetchPokemonFormList
        case fetchPokemonFormByID(Int)
        case fetchPokemonFormByName(String)
        case fetchPokemonHabitatList
        case fetchPokemonHabitatByID(Int)
        case fetchPokemonHabitatByName(String)
        case fetchPokemonShapeList
        case fetchPokemonShapeByID(Int)
        case fetchPokemonShapeByName(String)
        case fetchPokemonSpeciesList
        case fetchPokemonSpeciesByID(Int)
        case fetchPokemonSpeciesByName(String)
        case fetchStatList
        case fetchStatByID(Int)
        case fetchStatByName(String)
        case fetchTypeList
        case fetchTypeByID(Int)
        case fetchTypeByName(String)
        
        var path: String {
            switch self {
            case .fetchAbilityList:
                return "/ability"
            case .fetchAbilityByID(let id):
                return "/ability/\(id)"
            case .fetchAbilityByName(let name):
                return "/ability/\(name)"
            case .fetchCharacteristicList:
                return "/characteristic"
            case .fetchCharacteristic(let id):
                return "/characteristic/\(id)"
            case .fetchEggGroupList:
                return "/egg-group"
            case .fetchEggGroupByID(let id):
                return "/egg-group/\(id)"
            case .fetchEggGroupByName(let name):
                return "/egg-group/\(name)"
            case .fetchGenderList:
                return "/gender"
            case .fetchGenderByID(let id):
                return "/gender/\(id)"
            case .fetchGenderByName(let name):
                return "/gender/\(name)"
            case .fetchGrowthRateList:
                return "/growth-rate"
            case .fetchGrowthRateByID(let id):
                return "/growth-rate/\(id)"
            case .fetchGrowthRateByName(let name):
                return "/growth-rate/\(name)"
            case .fetchNatureList:
                return "/nature"
            case .fetchNatureByID(let id):
                return "/nature/\(id)"
            case .fetchNatureByName(let name):
                return "/nature/\(name)"
            case .fetchPokeathlonStatList:
                return "/pokeathlon-stat"
            case .fetchPokeathlonStatByID(let id):
                return "/pokeathlon-stat/\(id)"
            case .fetchPokeathlonStatByName(let name):
                return "/pokeathlon-stat/\(name)"
            case .fetchPokemonList:
                return "/pokemon"
            case .fetchPokemonByID(let id):
                return "/pokemon/\(id)"
            case .fetchPokemonByName(let name):
                return "/pokemon/\(name)"
            case .fetchPokemonColorList:
                return "/pokemon-color"
            case .fetchPokemonColorByID(let id):
                return "/pokemon-color/\(id)"
            case .fetchPokemonColorByName(let name):
                return "/pokemon-color/\(name)"
            case .fetchPokemonFormList:
                return "/pokemon-form"
            case .fetchPokemonFormByID(let id):
                return "/pokemon-form/\(id)"
            case .fetchPokemonFormByName(let name):
                return "/pokemon-form/\(name)"
            case .fetchPokemonHabitatList:
                return "/pokemon-habitat"
            case .fetchPokemonHabitatByID(let id):
                return "/pokemon-habitat/\(id)"
            case .fetchPokemonHabitatByName(let name):
                return "/pokemon-habitat/\(name)"
            case .fetchPokemonShapeList:
                return "/pokemon-shape"
            case .fetchPokemonShapeByID(let id):
                return "/pokemon-shape/\(id)"
            case .fetchPokemonShapeByName(let name):
                return "/pokemon-shape/\(name)"
            case .fetchPokemonSpeciesList:
                return "/pokemon-species"
            case .fetchPokemonSpeciesByID(let id):
                return "/pokemon-species/\(id)"
            case .fetchPokemonSpeciesByName(let name):
                return "/pokemon-species/\(name)"
            case .fetchStatList:
                return "/stat"
            case .fetchStatByID(let id):
                return "/stat/\(id)"
            case .fetchStatByName(let name):
                return "/stat/\(name)"
            case .fetchTypeList:
                return "/type"
            case .fetchTypeByID(let id):
                return "/type/\(id)"
            case .fetchTypeByName(let name):
                return "/type/\(name)"
            }
        }
    }
    
    public var session: URLSession
    
    public var baseURL: String = "https://pokeapi.co/api/v2"
    
    
    
    /**
     Fetch Abilities list
     */
    public func fetchAbilityList(paginationState: PaginationState<PKMAbility> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMAbility> {
        try await callPaginated(endpoint: API.fetchAbilityList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityID: Ability ID
     */
    public func fetchAbility(_ abilityID: Int) async throws -> PKMAbility {
        try await PKMAbility.decode(from: call(endpoint: API.fetchAbilityByID(abilityID)))
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityName: Ability Name
     */
    public func fetchAbility(_ abilityName: String) async throws -> PKMAbility {
        try await PKMAbility.decode(from: call(endpoint: API.fetchAbilityByName(abilityName)))
    }
    
    
    /**
     Fetch Characteristics list
     */
    public func fetchCharacteristicList(paginationState: PaginationState<PKMCharacteristic> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMCharacteristic> {
        try await callPaginated(endpoint: API.fetchCharacteristicList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Characteristic Information
     
     - parameter characteristicID: Characteristic ID
     */
    public func fetchCharacteristic(_ characteristicID: Int) async throws -> PKMCharacteristic {
        try await PKMCharacteristic.decode(from: call(endpoint: API.fetchCharacteristic(characteristicID)))
    }
    
    
    /**
     Fetch Egg Group list
     */
    public func fetchEggGroupList(paginationState: PaginationState<PKMEggGroup> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMEggGroup> {
        try await callPaginated(endpoint: API.fetchEggGroupList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupID: Egg Group ID
     */
    public func fetchEggGroup(_ eggGroupID: Int) async throws -> PKMEggGroup {
        try await PKMEggGroup.decode(from: call(endpoint: API.fetchEggGroupByID(eggGroupID)))
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupName: Egg Group Name
     */
    public func fetchEggGroup(_ eggGroupName: String) async throws -> PKMEggGroup {
        try await PKMEggGroup.decode(from: call(endpoint: API.fetchEggGroupByName(eggGroupName)))
    }
    
    
    /**
     Fetch Genders list
     */
    public func fetchGenderList(paginationState: PaginationState<PKMGender> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMGender> {
        try await callPaginated(endpoint: API.fetchGenderList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderID: Gender ID
     */
    public func fetchGender(_ genderID: Int) async throws -> PKMGender {
        try await PKMGender.decode(from: call(endpoint: API.fetchGenderByID(genderID)))
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderName: Gender Name
     */
    public func fetchGender(_ genderName: String) async throws -> PKMGender {
        try await PKMGender.decode(from: call(endpoint: API.fetchGenderByName(genderName)))
    }
    
    
    /**
     Fetch Growth Rate list
     */
    public func fetchGrowthRateList(paginationState: PaginationState<PKMGrowthRate> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMGrowthRate> {
        try await callPaginated(endpoint: API.fetchGrowthRateList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateID: Growth Rate ID
     */
    public func fetchGrowthRate(_ growthRateID: Int) async throws -> PKMGrowthRate {
        try await PKMGrowthRate.decode(from: call(endpoint: API.fetchGrowthRateByID(growthRateID)))
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateName: Growth Rate Name
     */
    public func fetchGrowthRate(_ growthRateName: String) async throws -> PKMGrowthRate {
        try await PKMGrowthRate.decode(from: call(endpoint: API.fetchGrowthRateByName(growthRateName)))
    }
    
    
    /**
     Fetch Nature list
     */
    public func fetchNatureList(paginationState: PaginationState<PKMNature> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMNature> {
        try await callPaginated(endpoint: API.fetchNatureList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Nature Information
     
     - parameter natureID: Nature ID
     */
    public func fetchNature(_ natureID: Int) async throws -> PKMNature {
        try await PKMNature.decode(from: call(endpoint: API.fetchNatureByID(natureID)))
    }
    
    
    /**
     Fetch Nature Information
     
     - parameter natureName: Nature Name
     */
    public func fetchNature(_ natureName: String) async throws -> PKMNature {
        try await PKMNature.decode(from: call(endpoint: API.fetchNatureByName(natureName)))
    }
    
    
    /**
     Fetch Pokeathlon Stat list
     */
    public func fetchPokeathlonStatList(paginationState: PaginationState<PKMPokeathlonStat> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPokeathlonStat> {
        try await callPaginated(endpoint: API.fetchPokeathlonStatList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatID: Pokeathlon Stat ID
     */
    public func fetchPokeathlonStat(_ pokeathlonStatID: Int) async throws -> PKMPokeathlonStat {
        try await PKMPokeathlonStat.decode(from: call(endpoint: API.fetchPokeathlonStatByID(pokeathlonStatID)))
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatName: Pokeathlon Stat Name
     */
    public func fetchPokeathlonStat(_ pokeathlonStatName: String) async throws -> PKMPokeathlonStat {
        try await PKMPokeathlonStat.decode(from: call(endpoint: API.fetchPokeathlonStatByName(pokeathlonStatName)))
    }
    
    
    /**
     Fetch Pokemon list
     */
    public func fetchPokemonList(paginationState: PaginationState<PKMPokemon> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPokemon> {
        try await callPaginated(endpoint: API.fetchPokemonList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonID: Pokemon ID
     */
    public func fetchPokemon(_ pokemonID: Int) async throws -> PKMPokemon {
        try await PKMPokemon.decode(from: call(endpoint: API.fetchPokemonByID(pokemonID)))
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonName: Pokemon Name
     */
    public func fetchPokemon(_ pokemonName: String) async throws -> PKMPokemon {
        try await PKMPokemon.decode(from: call(endpoint: API.fetchPokemonByName(pokemonName)))
    }
    
    
    /**
     Fetch Pokemon Color list
     */
    public func fetchPokemonColorList(paginationState: PaginationState<PKMPokemonColor> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPokemonColor> {
        try await callPaginated(endpoint: API.fetchPokemonColorList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorID: Pokemon Color ID
     */
    public func fetchPokemonColor(_ pokemonColorID: Int) async throws -> PKMPokemonColor {
        try await PKMPokemonColor.decode(from: call(endpoint: API.fetchPokemonColorByID(pokemonColorID)))
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorName: Pokemon Color Name
     */
    public func fetchPokemonColor(_ pokemonColorName: String) async throws -> PKMPokemonColor {
        try await PKMPokemonColor.decode(from: call(endpoint: API.fetchPokemonColorByName(pokemonColorName)))
    }
    
    
    /**
     Fetch Pokemon Form list
     */
    public func fetchPokemonFormList(paginationState: PaginationState<PKMPokemonForm> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPokemonForm> {
        try await callPaginated(endpoint: API.fetchPokemonFormList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormID: Pokemon Form ID
     */
    public func fetchPokemonForm(_ pokemonFormID: Int) async throws -> PKMPokemonForm {
        try await PKMPokemonForm.decode(from: call(endpoint: API.fetchPokemonFormByID(pokemonFormID)))
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormName: Pokemon Form Name
     */
    public func fetchPokemonForm(_ pokemonFormName: String) async throws -> PKMPokemonForm {
        try await PKMPokemonForm.decode(from: call(endpoint: API.fetchPokemonFormByName(pokemonFormName)))
    }
    
    
    /**
     Fetch Pokemon Habitat list
     */
    public func fetchPokemonHabitatList(paginationState: PaginationState<PKMPokemonHabitat> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPokemonHabitat> {
        try await callPaginated(endpoint: API.fetchPokemonHabitatList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatID: Pokemon Habitat ID
     */
    public func fetchPokemonHabitat(_ pokemonHabitatID: Int) async throws -> PKMPokemonHabitat {
        try await PKMPokemonHabitat.decode(from: call(endpoint: API.fetchPokemonHabitatByID(pokemonHabitatID)))
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatName: Pokemon Habitat Name
     */
    public func fetchPokemonHabitat(_ pokemonHabitatName: String) async throws -> PKMPokemonHabitat {
        try await PKMPokemonHabitat.decode(from: call(endpoint: API.fetchPokemonHabitatByName(pokemonHabitatName)))
    }
    
    
    /**
     Fetch Pokemon Shape list
     */
    public func fetchPokemonShapeList(paginationState: PaginationState<PKMPokemonShape> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPokemonShape> {
        try await callPaginated(endpoint: API.fetchPokemonShapeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeID: Pokemon Shape ID
     */
    public func fetchPokemonShape(_ pokemonShapeID: Int) async throws -> PKMPokemonShape {
        try await PKMPokemonShape.decode(from: call(endpoint: API.fetchPokemonShapeByID(pokemonShapeID)))
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeName: Pokemon Shape Name
     */
    public func fetchPokemonShape(_ pokemonShapeName: String) async throws -> PKMPokemonShape {
        try await PKMPokemonShape.decode(from: call(endpoint: API.fetchPokemonShapeByName(pokemonShapeName)))
    }
    
    
    /**
     Fetch Pokemon Species list
     */
    public func fetchPokemonSpeciesList(paginationState: PaginationState<PKMPokemonSpecies> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMPokemonSpecies> {
        try await callPaginated(endpoint: API.fetchPokemonSpeciesList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesID: Pokemon Species ID
     */
    public func fetchPokemonSpecies(_ pokemonSpeciesID: Int) async throws -> PKMPokemonSpecies {
        try await PKMPokemonSpecies.decode(from: call(endpoint: API.fetchPokemonSpeciesByID(pokemonSpeciesID)))
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesName: Pokemon Species Name
     */
    public func fetchPokemonSpecies(_ pokemonSpeciesName: String) async throws -> PKMPokemonSpecies {
        try await PKMPokemonSpecies.decode(from: call(endpoint: API.fetchPokemonSpeciesByName(pokemonSpeciesName)))
    }
    
    
    /**
     Fetch Stat list
     */
    public func fetchStatList(paginationState: PaginationState<PKMStat> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMStat> {
        try await callPaginated(endpoint: API.fetchStatList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statID: Stat ID
     */
    public func fetchStat(_ statID: Int) async throws -> PKMStat {
        try await PKMStat.decode(from: call(endpoint: API.fetchStatByID(statID)))
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statName: Stat Name
     */
    public func fetchStat(_ statName: String) async throws -> PKMStat {
        try await PKMStat.decode(from: call(endpoint: API.fetchStatByName(statName)))
    }
    
    
    /**
     Fetch Type list
     */
    public func fetchTypeList(paginationState: PaginationState<PKMType> = .initial(pageLimit: 20)) async throws -> PKMPagedObject<PKMType> {
        try await callPaginated(endpoint: API.fetchTypeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeID: Type ID
     */
    public func fetchType(_ typeID: Int) async throws -> PKMType {
        try await PKMType.decode(from: call(endpoint: API.fetchTypeByID(typeID)))
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeName: Type Name
     */
    public func fetchType(_ typeName: String) async throws -> PKMType {
        try await PKMType.decode(from: call(endpoint: API.fetchTypeByName(typeName)))
    }
}
