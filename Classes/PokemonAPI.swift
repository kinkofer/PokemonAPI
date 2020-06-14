//
//  PokemonAPI.swift
//  Pods
//
//  Created by Christopher Jennewein on 6/26/18.
//
//

import Foundation


let baseURL: String = "https://pokeapi.co/api/v2"


public class PokemonAPI {
    public static let baseURL: String = "https://pokeapi.co/api/v2"
    
    public static let berryService = BerryService(session: URLSession.shared, baseURL: baseURL)
    public static let contestService = ContestService(session: URLSession.shared, baseURL: baseURL)
    public static let encounterService = EncounterService(session: URLSession.shared, baseURL: baseURL)
    public static let evolutionService = EvolutionService(session: URLSession.shared, baseURL: baseURL)
    public static let gameService = GameService(session: URLSession.shared, baseURL: baseURL)
    public static let itemService = ItemService(session: URLSession.shared, baseURL: baseURL)
    public static let locationService = LocationService(session: URLSession.shared, baseURL: baseURL)
    public static let machineService = MachineService.self
    public static let moveService = MoveService.self
    public static let pokemonService = PokemonService.self
    public static let resourceService = ResourceService.self
    public static let utilityService = UtilityService.self
}












