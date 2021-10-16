//
//  CompletionExampleView.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 10/3/21.
//

import SwiftUI
import PokemonAPI


struct CompletionExampleView: View {
    @EnvironmentObject var pokemonAPI: PokemonAPI
    
    @State var pokemon: PKMPokemon?
    @State var error: Error?
    
    
    var body: some View {
        Group {
            if let error = error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else if let pokemon = pokemon,
                let name = pokemon.name {
                Text("A wild \(name) appeared!")
            }
            else {
                Text("Searching for Pokémon...")
            }
        }
        .onAppear {
            findPokemon()
        }
    }
    
    
    func findPokemon() {
        pokemonAPI.pokemonService.fetchPokemon(1) { result in
            switch result {
            case .success(let pokemon):
                self.pokemon = pokemon
            case .failure(let error):
                self.error = error
            }
        }
    }
}


struct CompletionExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CompletionExampleView()
            .environmentObject(PokemonAPI())
    }
}
