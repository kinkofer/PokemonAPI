//
//  PokemonAPI.swift
//  Pods
//
//  Created by Christopher Jennewein on 6/26/18.
//
//

import Foundation


public class PokemonAPI {
    public let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    public lazy private(set) var berryService = BerryService(session: session)
    public lazy private(set) var contestService = ContestService(session: session)
    public lazy private(set) var encounterService = EncounterService(session: session)
    public lazy private(set) var evolutionService = EvolutionService(session: session)
    public lazy private(set) var gameService = GameService(session: session)
    public lazy private(set) var itemService = ItemService(session: session)
    public lazy private(set) var locationService = LocationService(session: session)
    public lazy private(set) var machineService = MachineService(session: session)
    public lazy private(set) var moveService = MoveService(session: session)
    public lazy private(set) var pokemonService = PokemonService(session: session)
    public lazy private(set) var resourceService = ResourceService(session: session)
    public lazy private(set) var utilityService = UtilityService(session: session)
}












