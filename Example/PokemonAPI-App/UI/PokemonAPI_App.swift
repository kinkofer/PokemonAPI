//
//  PokemonAPI_App.swift
//  Shared
//
//  Created by Christopher Jennewein on 10/3/21.
//

import SwiftUI
import PokemonAPI


@main
struct PokemonAPI_App: App {
    var body: some Scene {
        WindowGroup {
            let pokemonAPI = PokemonAPI(session: .cached)
            ContentView()
                .environmentObject(pokemonAPI)
        }
    }
}
