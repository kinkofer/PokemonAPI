//
//  PokemonAPI.swift
//  Pods
//
//  Created by Christopher Jennewein on 6/26/18.
//
//

import Foundation


public final class PokemonAPI: Sendable {
    public let session: URLSession
    
    public init(session: URLSession = URLSession.shared) {
        self.session = session
        
        berryService = BerryService(session: session)
        contestService = ContestService(session: session)
        encounterService = EncounterService(session: session)
        evolutionService = EvolutionService(session: session)
        gameService = GameService(session: session)
        itemService = ItemService(session: session)
        locationService = LocationService(session: session)
        machineService = MachineService(session: session)
        moveService = MoveService(session: session)
        pokemonService = PokemonService(session: session)
        resourceService = ResourceService(session: session)
        utilityService = UtilityService(session: session)
    }
    
    public let berryService: BerryService
    public let contestService: ContestService
    public let encounterService: EncounterService
    public let evolutionService: EvolutionService
    public let gameService: GameService
    public let itemService: ItemService
    public let locationService: LocationService
    public let machineService: MachineService
    public let moveService: MoveService
    public let pokemonService: PokemonService
    public let resourceService: ResourceService
    public let utilityService: UtilityService
}
