//
//  AsyncAwaitExampleView.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 10/3/21.
//

import SwiftUI
import PokemonAPI


struct AsyncAwaitExampleView: View {
    @EnvironmentObject var pokemonAPI: PokemonAPI
    
    @State var versionGroup: PKMVersionGroup?
    @State var regions: [PKMRegion]?
    @State var error: Error?
    
    
    var body: some View {
        Group {
            if let error = error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else if let versionGroup = versionGroup,
               let name = versionGroup.name {
                Text("Game: \(name)")
                
                if let regions = regions {
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
            await findPokemon()
        }
    }
    
    
    func findPokemon() async {
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



struct AsyncAwaitExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitExampleView()
            .environmentObject(PokemonAPI())
    }
}
