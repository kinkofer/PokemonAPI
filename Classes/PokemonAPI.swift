//
//  PokemonAPI.swift
//  Pods
//
//  Created by Christopher Jennewein on 6/26/18.
//
//

import Foundation


public class PokemonAPI {
    public static let baseURL: String = "https://pokeapi.co/api/v2"
    
    public static let berryService = BerryService(session: URLSession.shared, baseURL: baseURL)
    public static let contestService = ContestService(session: URLSession.shared, baseURL: baseURL)
    public static let encounterService = EncounterService(session: URLSession.shared, baseURL: baseURL)
    public static let evolutionService = EvolutionService(session: URLSession.shared, baseURL: baseURL)
    public static let gameService = GameService(session: URLSession.shared, baseURL: baseURL)
    public static let itemService = ItemService(session: URLSession.shared, baseURL: baseURL)
    public static let locationService = LocationService(session: URLSession.shared, baseURL: baseURL)
    public static let machineService = MachineService(session: URLSession.shared, baseURL: baseURL)
    public static let moveService = MoveService(session: URLSession.shared, baseURL: baseURL)
    public static let pokemonService = PokemonService(session: URLSession.shared, baseURL: baseURL)
    public static let resourceService = ResourceService(session: URLSession.shared, baseURL: baseURL)
    public static let utilityService = UtilityService(session: URLSession.shared, baseURL: baseURL)
}












