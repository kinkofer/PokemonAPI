//
//  PokemonService.swift
//  PokemonAPI
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import Foundation


protocol PKMPokemonService: HTTPWebService {
    func fetchAbilityList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMAbility
    func fetchAbility(_ abilityID: Int, completion: @escaping (_ result: Result<PKMAbility, Error>) -> Void)
    func fetchAbility(_ abilityName: String, completion: @escaping (_ result: Result<PKMAbility, Error>) -> Void)
    func fetchCharacteristicList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMCharacteristic
    func fetchCharacteristic(_ characteristicID: Int, completion: @escaping (_ result: Result<PKMCharacteristic, Error>) -> Void)
    func fetchEggGroupList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEggGroup
    func fetchEggGroup(_ eggGroupID: Int, completion: @escaping (_ result: Result<PKMEggGroup, Error>) -> Void)
    func fetchEggGroup(_ eggGroupName: String, completion: @escaping (_ result: Result<PKMEggGroup, Error>) -> Void)
    func fetchGenderList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMGender
    func fetchGender(_ genderID: Int, completion: @escaping (_ result: Result<PKMGender, Error>) -> Void)
    func fetchGender(_ genderName: String, completion: @escaping (_ result: Result<PKMGender, Error>) -> Void)
    func fetchGrowthRateList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMGrowthRate
    func fetchGrowthRate(_ growthRateID: Int, completion: @escaping (_ result: Result<PKMGrowthRate, Error>) -> Void)
    func fetchGrowthRate(_ growthRateName: String, completion: @escaping (_ result: Result<PKMGrowthRate, Error>) -> Void)
    func fetchNatureList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMNature
    func fetchNature(_ natureID: Int, completion: @escaping (_ result: Result<PKMNature, Error>) -> Void)
    func fetchNature(_ natureName: String, completion: @escaping (_ result: Result<PKMNature, Error>) -> Void)
    func fetchPokeathlonStatList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokeathlonStat
    func fetchPokeathlonStat(_ pokeathlonStatID: Int, completion: @escaping (_ result: Result<PKMPokeathlonStat, Error>) -> Void)
    func fetchPokeathlonStat(_ pokeathlonStatName: String, completion: @escaping (_ result: Result<PKMPokeathlonStat, Error>) -> Void)
    func fetchPokemonList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemon
    func fetchPokemon(_ pokemonID: Int, completion: @escaping (_ result: Result<PKMPokemon, Error>) -> Void)
    func fetchPokemon(_ pokemonName: String, completion: @escaping (_ result: Result<PKMPokemon, Error>) -> Void)
    func fetchPokemonColorList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonColor
    func fetchPokemonColor(_ pokemonColorID: Int, completion: @escaping (_ result: Result<PKMPokemonColor, Error>) -> Void)
    func fetchPokemonColor(_ pokemonColorName: String, completion: @escaping (_ result: Result<PKMPokemonColor, Error>) -> Void)
    func fetchPokemonFormList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonForm
    func fetchPokemonForm(_ pokemonFormID: Int, completion: @escaping (_ result: Result<PKMPokemonForm, Error>) -> Void)
    func fetchPokemonForm(_ pokemonFormName: String, completion: @escaping (_ result: Result<PKMPokemonForm, Error>) -> Void)
    func fetchPokemonHabitatList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonHabitat
    func fetchPokemonHabitat(_ pokemonHabitatID: Int, completion: @escaping (_ result: Result<PKMPokemonHabitat, Error>) -> Void)
    func fetchPokemonHabitat(_ pokemonHabitatName: String, completion: @escaping (_ result: Result<PKMPokemonHabitat, Error>) -> Void)
    func fetchPokemonShapeList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonShape
    func fetchPokemonShape(_ pokemonShapeID: Int, completion: @escaping (_ result: Result<PKMPokemonShape, Error>) -> Void)
    func fetchPokemonShape(_ pokemonShapeName: String, completion: @escaping (_ result: Result<PKMPokemonShape, Error>) -> Void)
    func fetchPokemonSpeciesList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonSpecies
    func fetchPokemonSpecies(_ pokemonSpeciesID: Int, completion: @escaping (_ result: Result<PKMPokemonSpecies, Error>) -> Void)
    func fetchPokemonSpecies(_ pokemonSpeciesName: String, completion: @escaping (_ result: Result<PKMPokemonSpecies, Error>) -> Void)
    func fetchStatList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMStat
    func fetchStat(_ statID: Int, completion: @escaping (_ result: Result<PKMStat, Error>) -> Void)
    func fetchStat(_ statName: String, completion: @escaping (_ result: Result<PKMStat, Error>) -> Void)
    func fetchTypeList<T>(paginationState: PaginationState<T>, completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMType
    func fetchType(_ typeID: Int, completion: @escaping (_ result: Result<PKMType, Error>) -> Void)
    func fetchType(_ typeName: String, completion: @escaping (_ result: Result<PKMType, Error>) -> Void)
    
    
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchAbilityList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMAbility
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchAbility(_ abilityID: Int) async throws -> PKMAbility
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchAbility(_ abilityName: String) async throws -> PKMAbility
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchCharacteristicList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMCharacteristic
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchCharacteristic(_ characteristicID: Int) async throws -> PKMCharacteristic
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchEggGroupList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEggGroup
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchEggGroup(_ eggGroupID: Int) async throws -> PKMEggGroup
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchEggGroup(_ eggGroupName: String) async throws -> PKMEggGroup
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchGenderList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMGender
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchGender(_ genderID: Int) async throws -> PKMGender
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchGender(_ genderName: String) async throws -> PKMGender
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchGrowthRateList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMGrowthRate
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchGrowthRate(_ growthRateID: Int) async throws -> PKMGrowthRate
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchGrowthRate(_ growthRateName: String) async throws -> PKMGrowthRate
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchNatureList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMNature
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchNature(_ natureID: Int) async throws -> PKMNature
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchNature(_ natureName: String) async throws -> PKMNature
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokeathlonStatList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokeathlonStat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokeathlonStat(_ pokeathlonStatID: Int) async throws -> PKMPokeathlonStat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokeathlonStat(_ pokeathlonStatName: String) async throws -> PKMPokeathlonStat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemon
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemon(_ pokemonID: Int) async throws -> PKMPokemon
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemon(_ pokemonName: String) async throws -> PKMPokemon
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonColorList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonColor
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonColor(_ pokemonColorID: Int) async throws -> PKMPokemonColor
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonColor(_ pokemonColorName: String) async throws -> PKMPokemonColor
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonFormList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonForm
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonForm(_ pokemonFormID: Int) async throws -> PKMPokemonForm
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonForm(_ pokemonFormName: String) async throws -> PKMPokemonForm
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonHabitatList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonHabitat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonHabitat(_ pokemonHabitatID: Int) async throws -> PKMPokemonHabitat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonHabitat(_ pokemonHabitatName: String) async throws -> PKMPokemonHabitat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonShapeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonShape
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonShape(_ pokemonShapeID: Int) async throws -> PKMPokemonShape
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonShape(_ pokemonShapeName: String) async throws -> PKMPokemonShape
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonSpeciesList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonSpecies
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonSpecies(_ pokemonSpeciesID: Int) async throws -> PKMPokemonSpecies
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchPokemonSpecies(_ pokemonSpeciesName: String) async throws -> PKMPokemonSpecies
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchStatList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMStat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchStat(_ statID: Int) async throws -> PKMStat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchStat(_ statName: String) async throws -> PKMStat
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchTypeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMType
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchType(_ typeID: Int) async throws -> PKMType
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func fetchType(_ typeName: String) async throws -> PKMType
}



// MARK: - Web Services

public struct PokemonService: PKMPokemonService {
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
    
    
    
    // MARK: - Completion Services
    
    /**
     Fetch Abilities list
     */
    public func fetchAbilityList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMAbility {
        callPaginated(endpoint: API.fetchAbilityList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityID: Ability ID
     */
    public func fetchAbility(_ abilityID: Int, completion: @escaping (_ result: Result<PKMAbility, Error>) -> Void) {
        call(endpoint: API.fetchAbilityByID(abilityID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityName: Ability Name
     */
    public func fetchAbility(_ abilityName: String, completion: @escaping (_ result: Result<PKMAbility, Error>) -> Void) {
        call(endpoint: API.fetchAbilityByName(abilityName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Characteristics list
     */
    public func fetchCharacteristicList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMCharacteristic {
        callPaginated(endpoint: API.fetchCharacteristicList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Characteristic Information
     
     - parameter characteristicID: Characteristic ID
     */
    public func fetchCharacteristic(_ characteristicID: Int, completion: @escaping (_ result: Result<PKMCharacteristic, Error>) -> Void) {
        call(endpoint: API.fetchCharacteristic(characteristicID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Egg Group list
     */
    public func fetchEggGroupList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMEggGroup {
        callPaginated(endpoint: API.fetchEggGroupList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupID: Egg Group ID
     */
    public func fetchEggGroup(_ eggGroupID: Int, completion: @escaping (_ result: Result<PKMEggGroup, Error>) -> Void) {
        call(endpoint: API.fetchEggGroupByID(eggGroupID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupName: Egg Group Name
     */
    public func fetchEggGroup(_ eggGroupName: String, completion: @escaping (_ result: Result<PKMEggGroup, Error>) -> Void) {
        call(endpoint: API.fetchEggGroupByName(eggGroupName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Genders list
     */
    public func fetchGenderList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMGender {
        callPaginated(endpoint: API.fetchGenderList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderID: Gender ID
     */
    public func fetchGender(_ genderID: Int, completion: @escaping (_ result: Result<PKMGender, Error>) -> Void) {
        call(endpoint: API.fetchGenderByID(genderID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderName: Gender Name
     */
    public func fetchGender(_ genderName: String, completion: @escaping (_ result: Result<PKMGender, Error>) -> Void) {
        call(endpoint: API.fetchGenderByName(genderName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Growth Rate list
     */
    public func fetchGrowthRateList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMGrowthRate {
        callPaginated(endpoint: API.fetchGrowthRateList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateID: Growth Rate ID
     */
    public func fetchGrowthRate(_ growthRateID: Int, completion: @escaping (_ result: Result<PKMGrowthRate, Error>) -> Void) {
        call(endpoint: API.fetchGrowthRateByID(growthRateID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateName: Growth Rate Name
     */
    public func fetchGrowthRate(_ growthRateName: String, completion: @escaping (_ result: Result<PKMGrowthRate, Error>) -> Void) {
        call(endpoint: API.fetchGrowthRateByName(growthRateName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Nature list
     */
    public func fetchNatureList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMNature {
        callPaginated(endpoint: API.fetchNatureList, paginationState: paginationState, completion: completion)
    }
    
    /**
     Fetch Nature Information
     
     - parameter natureID: Nature ID
     */
    public func fetchNature(_ natureID: Int, completion: @escaping (_ result: Result<PKMNature, Error>) -> Void) {
        call(endpoint: API.fetchNatureByID(natureID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Nature Information
     
     - parameter natureName: Nature Name
     */
    public func fetchNature(_ natureName: String, completion: @escaping (_ result: Result<PKMNature, Error>) -> Void) {
        call(endpoint: API.fetchNatureByName(natureName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokeathlon Stat list
     */
    public func fetchPokeathlonStatList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokeathlonStat {
        callPaginated(endpoint: API.fetchPokeathlonStatList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatID: Pokeathlon Stat ID
     */
    public func fetchPokeathlonStat(_ pokeathlonStatID: Int, completion: @escaping (_ result: Result<PKMPokeathlonStat, Error>) -> Void) {
        call(endpoint: API.fetchPokeathlonStatByID(pokeathlonStatID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatName: Pokeathlon Stat Name
     */
    public func fetchPokeathlonStat(_ pokeathlonStatName: String, completion: @escaping (_ result: Result<PKMPokeathlonStat, Error>) -> Void) {
        call(endpoint: API.fetchPokeathlonStatByName(pokeathlonStatName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon list
     */
    public func fetchPokemonList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemon {
        callPaginated(endpoint: API.fetchPokemonList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonID: Pokemon ID
     */
    public func fetchPokemon(_ pokemonID: Int, completion: @escaping (_ result: Result<PKMPokemon, Error>) -> Void) {
        call(endpoint: API.fetchPokemonByID(pokemonID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonName: Pokemon Name
     */
    public func fetchPokemon(_ pokemonName: String, completion: @escaping (_ result: Result<PKMPokemon, Error>) -> Void) {
        call(endpoint: API.fetchPokemonByName(pokemonName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Color list
     */
    public func fetchPokemonColorList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonColor {
        callPaginated(endpoint: API.fetchPokemonColorList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorID: Pokemon Color ID
     */
    public func fetchPokemonColor(_ pokemonColorID: Int, completion: @escaping (_ result: Result<PKMPokemonColor, Error>) -> Void) {
        call(endpoint: API.fetchPokemonColorByID(pokemonColorID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorName: Pokemon Color Name
     */
    public func fetchPokemonColor(_ pokemonColorName: String, completion: @escaping (_ result: Result<PKMPokemonColor, Error>) -> Void) {
        call(endpoint: API.fetchPokemonColorByName(pokemonColorName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Form list
     */
    public func fetchPokemonFormList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonForm {
        callPaginated(endpoint: API.fetchPokemonFormList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormID: Pokemon Form ID
     */
    public func fetchPokemonForm(_ pokemonFormID: Int, completion: @escaping (_ result: Result<PKMPokemonForm, Error>) -> Void) {
        call(endpoint: API.fetchPokemonFormByID(pokemonFormID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormName: Pokemon Form Name
     */
    public func fetchPokemonForm(_ pokemonFormName: String, completion: @escaping (_ result: Result<PKMPokemonForm, Error>) -> Void) {
        call(endpoint: API.fetchPokemonFormByName(pokemonFormName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Habitat list
     */
    public func fetchPokemonHabitatList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonHabitat {
        callPaginated(endpoint: API.fetchPokemonHabitatList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatID: Pokemon Habitat ID
     */
    public func fetchPokemonHabitat(_ pokemonHabitatID: Int, completion: @escaping (_ result: Result<PKMPokemonHabitat, Error>) -> Void) {
        call(endpoint: API.fetchPokemonHabitatByID(pokemonHabitatID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatName: Pokemon Habitat Name
     */
    public func fetchPokemonHabitat(_ pokemonHabitatName: String, completion: @escaping (_ result: Result<PKMPokemonHabitat, Error>) -> Void) {
        call(endpoint: API.fetchPokemonHabitatByName(pokemonHabitatName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Shape list
     */
    public func fetchPokemonShapeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonShape {
        callPaginated(endpoint: API.fetchPokemonShapeList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeID: Pokemon Shape ID
     */
    public func fetchPokemonShape(_ pokemonShapeID: Int, completion: @escaping (_ result: Result<PKMPokemonShape, Error>) -> Void) {
        call(endpoint: API.fetchPokemonShapeByID(pokemonShapeID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeName: Pokemon Shape Name
     */
    public func fetchPokemonShape(_ pokemonShapeName: String, completion: @escaping (_ result: Result<PKMPokemonShape, Error>) -> Void) {
        call(endpoint: API.fetchPokemonShapeByName(pokemonShapeName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Species list
     */
    public func fetchPokemonSpeciesList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMPokemonSpecies {
        callPaginated(endpoint: API.fetchPokemonSpeciesList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesID: Pokemon Species ID
     */
    public func fetchPokemonSpecies(_ pokemonSpeciesID: Int, completion: @escaping (_ result: Result<PKMPokemonSpecies, Error>) -> Void) {
        call(endpoint: API.fetchPokemonSpeciesByID(pokemonSpeciesID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesName: Pokemon Species Name
     */
    public func fetchPokemonSpecies(_ pokemonSpeciesName: String, completion: @escaping (_ result: Result<PKMPokemonSpecies, Error>) -> Void) {
        call(endpoint: API.fetchPokemonSpeciesByName(pokemonSpeciesName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Stat list
     */
    public func fetchStatList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMStat {
        callPaginated(endpoint: API.fetchStatList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statID: Stat ID
     */
    public func fetchStat(_ statID: Int, completion: @escaping (_ result: Result<PKMStat, Error>) -> Void) {
        call(endpoint: API.fetchStatByID(statID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statName: Stat Name
     */
    public func fetchStat(_ statName: String, completion: @escaping (_ result: Result<PKMStat, Error>) -> Void) {
        call(endpoint: API.fetchStatByName(statName)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Type list
     */
    public func fetchTypeList<T>(paginationState: PaginationState<T> = .initial(pageLimit: 20), completion: @escaping (_ result: Result<PKMPagedObject<T>, Error>) -> Void) where T: PKMType {
        callPaginated(endpoint: API.fetchTypeList, paginationState: paginationState, completion: completion)
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeID: Type ID
     */
    public func fetchType(_ typeID: Int, completion: @escaping (_ result: Result<PKMType, Error>) -> Void) {
        call(endpoint: API.fetchTypeByID(typeID)) { result in
            result.decode(completion: completion)
        }
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeName: Type Name
     */
    public func fetchType(_ typeName: String, completion: @escaping (_ result: Result<PKMType, Error>) -> Void) {
        call(endpoint: API.fetchTypeByName(typeName)) { result in
            result.decode(completion: completion)
        }
    }
}



// MARK: - Async Services

extension PokemonService {
    /**
     Fetch Abilities list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchAbilityList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMAbility {
        try await callPaginated(endpoint: API.fetchAbilityList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityID: Ability ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchAbility(_ abilityID: Int) async throws -> PKMAbility {
        try await PKMAbility.decode(from: call(endpoint: API.fetchAbilityByID(abilityID)))
    }
    
    
    /**
     Fetch Ability Information
     
     - parameter abilityName: Ability Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchAbility(_ abilityName: String) async throws -> PKMAbility {
        try await PKMAbility.decode(from: call(endpoint: API.fetchAbilityByName(abilityName)))
    }
    
    
    /**
     Fetch Characteristics list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchCharacteristicList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMCharacteristic {
        try await callPaginated(endpoint: API.fetchCharacteristicList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Characteristic Information
     
     - parameter characteristicID: Characteristic ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchCharacteristic(_ characteristicID: Int) async throws -> PKMCharacteristic {
        try await PKMCharacteristic.decode(from: call(endpoint: API.fetchCharacteristic(characteristicID)))
    }
    
    
    /**
     Fetch Egg Group list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchEggGroupList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMEggGroup {
        try await callPaginated(endpoint: API.fetchEggGroupList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupID: Egg Group ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchEggGroup(_ eggGroupID: Int) async throws -> PKMEggGroup {
        try await PKMEggGroup.decode(from: call(endpoint: API.fetchEggGroupByID(eggGroupID)))
    }
    
    
    /**
     Fetch Egg Group Information
     
     - parameter eggGroupName: Egg Group Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchEggGroup(_ eggGroupName: String) async throws -> PKMEggGroup {
        try await PKMEggGroup.decode(from: call(endpoint: API.fetchEggGroupByName(eggGroupName)))
    }
    
    
    /**
     Fetch Genders list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGenderList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMGender {
        try await callPaginated(endpoint: API.fetchGenderList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderID: Gender ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGender(_ genderID: Int) async throws -> PKMGender {
        try await PKMGender.decode(from: call(endpoint: API.fetchGenderByID(genderID)))
    }
    
    
    /**
     Fetch Gender Information
     
     - parameter genderName: Gender Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGender(_ genderName: String) async throws -> PKMGender {
        try await PKMGender.decode(from: call(endpoint: API.fetchGenderByName(genderName)))
    }
    
    
    /**
     Fetch Growth Rate list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGrowthRateList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMGrowthRate {
        try await callPaginated(endpoint: API.fetchGrowthRateList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateID: Growth Rate ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGrowthRate(_ growthRateID: Int) async throws -> PKMGrowthRate {
        try await PKMGrowthRate.decode(from: call(endpoint: API.fetchGrowthRateByID(growthRateID)))
    }
    
    
    /**
     Fetch Growth Rate Information
     
     - parameter growthRateName: Growth Rate Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchGrowthRate(_ growthRateName: String) async throws -> PKMGrowthRate {
        try await PKMGrowthRate.decode(from: call(endpoint: API.fetchGrowthRateByName(growthRateName)))
    }
    
    
    /**
     Fetch Nature list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchNatureList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMNature {
        try await callPaginated(endpoint: API.fetchNatureList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Nature Information
     
     - parameter natureID: Nature ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchNature(_ natureID: Int) async throws -> PKMNature {
        try await PKMNature.decode(from: call(endpoint: API.fetchNatureByID(natureID)))
    }
    
    
    /**
     Fetch Nature Information
     
     - parameter natureName: Nature Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchNature(_ natureName: String) async throws -> PKMNature {
        try await PKMNature.decode(from: call(endpoint: API.fetchNatureByName(natureName)))
    }
    
    
    /**
     Fetch Pokeathlon Stat list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokeathlonStatList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokeathlonStat {
        try await callPaginated(endpoint: API.fetchPokeathlonStatList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatID: Pokeathlon Stat ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokeathlonStat(_ pokeathlonStatID: Int) async throws -> PKMPokeathlonStat {
        try await PKMPokeathlonStat.decode(from: call(endpoint: API.fetchPokeathlonStatByID(pokeathlonStatID)))
    }
    
    
    /**
     Fetch Pokeathlon Stat Information
     
     - parameter pokeathlonStatName: Pokeathlon Stat Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokeathlonStat(_ pokeathlonStatName: String) async throws -> PKMPokeathlonStat {
        try await PKMPokeathlonStat.decode(from: call(endpoint: API.fetchPokeathlonStatByName(pokeathlonStatName)))
    }
    
    
    /**
     Fetch Pokemon list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemon {
        try await callPaginated(endpoint: API.fetchPokemonList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonID: Pokemon ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemon(_ pokemonID: Int) async throws -> PKMPokemon {
        try await PKMPokemon.decode(from: call(endpoint: API.fetchPokemonByID(pokemonID)))
    }
    
    
    /**
     Fetch Pokemon Information
     
     - parameter pokemonName: Pokemon Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemon(_ pokemonName: String) async throws -> PKMPokemon {
        try await PKMPokemon.decode(from: call(endpoint: API.fetchPokemonByName(pokemonName)))
    }
    
    
    /**
     Fetch Pokemon Color list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonColorList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonColor {
        try await callPaginated(endpoint: API.fetchPokemonColorList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorID: Pokemon Color ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonColor(_ pokemonColorID: Int) async throws -> PKMPokemonColor {
        try await PKMPokemonColor.decode(from: call(endpoint: API.fetchPokemonColorByID(pokemonColorID)))
    }
    
    
    /**
     Fetch Pokemon Color Information
     
     - parameter pokemonColorName: Pokemon Color Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonColor(_ pokemonColorName: String) async throws -> PKMPokemonColor {
        try await PKMPokemonColor.decode(from: call(endpoint: API.fetchPokemonColorByName(pokemonColorName)))
    }
    
    
    /**
     Fetch Pokemon Form list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonFormList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonForm {
        try await callPaginated(endpoint: API.fetchPokemonFormList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormID: Pokemon Form ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonForm(_ pokemonFormID: Int) async throws -> PKMPokemonForm {
        try await PKMPokemonForm.decode(from: call(endpoint: API.fetchPokemonFormByID(pokemonFormID)))
    }
    
    
    /**
     Fetch Pokemon Form Information
     
     - parameter pokemonFormName: Pokemon Form Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonForm(_ pokemonFormName: String) async throws -> PKMPokemonForm {
        try await PKMPokemonForm.decode(from: call(endpoint: API.fetchPokemonFormByName(pokemonFormName)))
    }
    
    
    /**
     Fetch Pokemon Habitat list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonHabitatList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonHabitat {
        try await callPaginated(endpoint: API.fetchPokemonHabitatList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatID: Pokemon Habitat ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonHabitat(_ pokemonHabitatID: Int) async throws -> PKMPokemonHabitat {
        try await PKMPokemonHabitat.decode(from: call(endpoint: API.fetchPokemonHabitatByID(pokemonHabitatID)))
    }
    
    
    /**
     Fetch Pokemon Habitat Information
     
     - parameter pokemonHabitatName: Pokemon Habitat Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonHabitat(_ pokemonHabitatName: String) async throws -> PKMPokemonHabitat {
        try await PKMPokemonHabitat.decode(from: call(endpoint: API.fetchPokemonHabitatByName(pokemonHabitatName)))
    }
    
    
    /**
     Fetch Pokemon Shape list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonShapeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonShape {
        try await callPaginated(endpoint: API.fetchPokemonShapeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeID: Pokemon Shape ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonShape(_ pokemonShapeID: Int) async throws -> PKMPokemonShape {
        try await PKMPokemonShape.decode(from: call(endpoint: API.fetchPokemonShapeByID(pokemonShapeID)))
    }
    
    
    /**
     Fetch Pokemon Shape Information
     
     - parameter pokemonShapeName: Pokemon Shape Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonShape(_ pokemonShapeName: String) async throws -> PKMPokemonShape {
        try await PKMPokemonShape.decode(from: call(endpoint: API.fetchPokemonShapeByName(pokemonShapeName)))
    }
    
    
    /**
     Fetch Pokemon Species list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonSpeciesList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMPokemonSpecies {
        try await callPaginated(endpoint: API.fetchPokemonSpeciesList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesID: Pokemon Species ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonSpecies(_ pokemonSpeciesID: Int) async throws -> PKMPokemonSpecies {
        try await PKMPokemonSpecies.decode(from: call(endpoint: API.fetchPokemonSpeciesByID(pokemonSpeciesID)))
    }
    
    
    /**
     Fetch Pokemon Species Information
     
     - parameter pokemonSpeciesName: Pokemon Species Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchPokemonSpecies(_ pokemonSpeciesName: String) async throws -> PKMPokemonSpecies {
        try await PKMPokemonSpecies.decode(from: call(endpoint: API.fetchPokemonSpeciesByName(pokemonSpeciesName)))
    }
    
    
    /**
     Fetch Stat list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchStatList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMStat {
        try await callPaginated(endpoint: API.fetchStatList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statID: Stat ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchStat(_ statID: Int) async throws -> PKMStat {
        try await PKMStat.decode(from: call(endpoint: API.fetchStatByID(statID)))
    }
    
    
    /**
     Fetch Stat Information
     
     - parameter statName: Stat Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchStat(_ statName: String) async throws -> PKMStat {
        try await PKMStat.decode(from: call(endpoint: API.fetchStatByName(statName)))
    }
    
    
    /**
     Fetch Type list
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchTypeList<T>(paginationState: PaginationState<T>) async throws -> PKMPagedObject<T> where T: PKMType {
        try await callPaginated(endpoint: API.fetchTypeList, paginationState: paginationState)
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeID: Type ID
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchType(_ typeID: Int) async throws -> PKMType {
        try await PKMType.decode(from: call(endpoint: API.fetchTypeByID(typeID)))
    }
    
    
    /**
     Fetch Type Information
     
     - parameter typeName: Type Name
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func fetchType(_ typeName: String) async throws -> PKMType {
        try await PKMType.decode(from: call(endpoint: API.fetchTypeByName(typeName)))
    }
}
