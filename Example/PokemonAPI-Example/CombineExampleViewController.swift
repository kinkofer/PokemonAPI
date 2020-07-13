//
//  CombineExampleViewController.swift
//  PokemonAPI-Example
//
//  Created by Christopher Jennewein on 6/13/20.
//  Copyright © 2020 Prismatic Games. All rights reserved.
//

import UIKit
import PokemonAPI
import Combine


@available(iOS 13, *)
class CombineExampleViewController: UIViewController {
    let pokemonAPI = PokemonAPI()
    var cancellables = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonAPI.berryService.fetchBerry(5)
            .tryMap { berry -> PKMNamedAPIResource<PKMBerryFirmness> in
                print(berry)
                guard let berryFirmness = berry.firmness else {
                    throw HTTPError.unexpectedResponse
                }
                return berryFirmness
            }
            .flatMap { berryFirmness in
                return self.pokemonAPI.resourceService.fetch(berryFirmness)
            }
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { berryFirmness in
                print(berryFirmness)
            })
            .store(in: &cancellables)
    }
}
