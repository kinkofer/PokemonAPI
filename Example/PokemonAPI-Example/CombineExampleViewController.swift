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
    var cancellables = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PokemonAPI().berryService.fetchBerry(5)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { berry in
                print(berry)
            })
            .store(in: &cancellables)
    }
    
}
