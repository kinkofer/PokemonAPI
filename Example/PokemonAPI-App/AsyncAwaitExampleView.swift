//
//  AsyncAwaitExampleView.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 10/3/21.
//

import SwiftUI
import PokemonAPI


struct AsyncAwaitExampleView: View {
    @State var viewModel = AsyncAwaitExampleView.ViewModel()
    
    
    var body: some View {
        Group {
            if let error = viewModel.error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else if let versionGroup = viewModel.versionGroup,
               let name = versionGroup.name {
                Text("Game: \(name)")
                
                if let regions = viewModel.regions {
                    Text("Regions: \(regions.compactMap { $0.name }.joined(separator: ", "))")
                }
                else {
                    Text("... fetching regions.")
                }
            }
            else {
                Text("Getting Pokémon game...")
            }
        }
        .task {
            await viewModel.findRegions()
        }
    }
    
    
    
}


extension AsyncAwaitExampleView {
    @MainActor
    @Observable
    class ViewModel {
        let pokemonAPI: PokemonAPI
        
        private(set) var versionGroup: PKMVersionGroup?
        private(set) var regions: [PKMRegion]?
        private(set) var error: Error?
        
        init() {
            pokemonAPI = PokemonAPI()
        }
        
        
        func findRegions() async {
            do {
                versionGroup = try await pokemonAPI.gameService.fetchVersionGroup(3)
                
                if let regionResources = versionGroup?.regions {
                    for regionResource in regionResources {
                        let region = try await pokemonAPI.resourceService.fetch(regionResource)
                        if regions == nil {
                            regions = [region]
                        }
                        else {
                            regions?.append(region)
                        }
                    }
                }
            }
            catch {
                self.error = error
            }
        }
    }
}



struct AsyncAwaitExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitExampleView()
            .environmentObject(PokemonAPI())
    }
}
