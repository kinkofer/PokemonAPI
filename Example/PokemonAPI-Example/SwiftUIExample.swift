//
//  SwiftUIExample.swift
//  PokemonAPI-Example
//
//  Created by Christopher Jennewein on 7/12/21.
//  Copyright © 2021 Prismatic Games. All rights reserved.
//

import SwiftUI
import PokemonAPI
import Combine


class BerryViewModel: ObservableObject {
    @Published var berry: PKMBerry?
    @Published var error: Error?
    
    let pokemonAPI = PokemonAPI()
    var cancellables = Set<AnyCancellable>()
    
    
    func fetchBerry(_ berryName: String) {
        pokemonAPI.berryService.fetchBerry(berryName)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { berry in
                self.berry = berry
            })
            .store(in: &cancellables)
        
        // Alternatively (if Combine/Publishers are too advanced a topic), you can use this structure:
//        pokemonAPI.berryService.fetchBerry(berryName) { result in
//            switch result {
//            case .success(let berry):
//                self.berry = berry
//            case .failure(let error):
//                self.error = error
//            }
//        }
    }
}


struct BerryView: View {
    @ObservedObject var viewModel = BerryViewModel()
    
    var body: some View {
        Group {
            if let berry = viewModel.berry {
                Text("Found \(berry.name ?? "unknown berry")")
            }
            else if let error = viewModel.error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else {
                Text("Fetching berry...")
            }
        }
        .onAppear {
            viewModel.fetchBerry("cheri")
        }
    }
}
