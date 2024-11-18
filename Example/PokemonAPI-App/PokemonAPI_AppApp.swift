//
//  PokemonAPI_AppApp.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 11/17/24.
//

import PokemonAPI
import SwiftUI
import SwiftData

@main
struct PokemonAPI_AppApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var pokemonAPI = PokemonAPI()

    var body: some Scene {
        WindowGroup {
            ExampleMenuView()
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(pokemonAPI)
    }
}
