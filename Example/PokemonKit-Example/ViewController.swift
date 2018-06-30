//
//  ViewController.swift
//  PokemonKit-Example
//
//  Created by Yeung Yiu Hung on 8/8/2016.
//  Copyright © 2016年 Yeung Yiu Hung. All rights reserved.
//

import UIKit
import PokemonKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PokemonKit.berryService.fetchBerryList() { result in
            switch result {
            case .success(let berryList):
                print(berryList)
                if let berryResource = berryList.results?.first {
                    PokemonKit.utilityService.fetch(berryResource) { result in
                        switch result {
                        case .success(let berry):
                            print(berry.name!)
                        case .failure(let error):
                            print(error.message)
                        }
                    }
                }
            case .failure(let error):
                print(error.message)
            }
        }
        
        PokemonKit.berryService.fetchBerry("1") { result in
            switch result {
            case .success(let berryInfo):
                print(berryInfo.name!)
            case .failure(let error):
                print(error.message)
            }
        }
        
        PokemonKit.pokemonService.fetchPokemon("1") { result in
            switch result {
            case .success(let decoded):
                print(decoded)
            case .failure(let error):
                print(error.message)
            }
        }
        
        
        PokemonKit.utilityService.fetchLanguageList(paginationState: .initial(pageLimit: 5)) { result in
            switch result {
            case .success(let pagedLanguages):
                print(pagedLanguages)
                print("Language count: \(pagedLanguages.count!)")
                
                PokemonKit.utilityService.fetchLanguageList(paginationState: .continuing(pagedLanguages, .next)) { result in
                    switch result {
                    case .success(let pagedLanguagesNext):
                        print("Language page: \(pagedLanguagesNext.currentPage)")
                    case .failure(let error):
                        print(error.message)
                    }
                }
            case .failure(let error):
                print(error.message)
            }
        }
    }

}

