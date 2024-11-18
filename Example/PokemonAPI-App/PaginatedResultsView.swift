//
//  PaginatedResultsView.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 10/3/21.
//

import SwiftUI
import PokemonAPI


struct PaginatedResultsView: View {
    @EnvironmentObject var pokemonAPI: PokemonAPI
    @State var error: Error?
    
    /// The current pagedObject returned from the paginated web service call.
    @State var pagedObject: PKMPagedObject<PKMPokemon>?
    @State var pageIndex = 0
    
    
    var body: some View {
        mainContent
            .toolbar {
                ToolbarItemGroup(placement: .principal) {
                    menu
                }
            }
            .task {
                await fetchPokemon()
            }
    }
    
    
    var mainContent: some View {
        VStack {
            if let error = error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else if let pagedObject = pagedObject,
                    let pokemonResults = pagedObject.results as? [PKMNamedAPIResource] {
                List {
                    ForEach(pokemonResults, id: \.url) { pokemon in
                        Text(pokemon.name ?? "Unknown Pokemon")
                    }
                }
                .listStyle(.plain)
            }
        }
    }
    
    
    var menu: some View {
        HStack {
            Button("First") {
                guard let pagedObject = pagedObject else { return }
                Task { await fetchPokemon(paginationState: .continuing(pagedObject, .first)) }
            }
            .disabled(pagedObject?.hasPrevious == false)
            
            Spacer()
            
            Button(action: {
                guard let pagedObject = pagedObject else { return }
                Task { await fetchPokemon(paginationState: .continuing(pagedObject, .previous)) }
            }) {
                Image.left
            }
            .disabled(pagedObject?.hasPrevious == false)
            
            Spacer()
            
            pagePicker
                .disabled(pagedObject?.pages ?? 0 <= 1)
            
            Spacer()
            
            Button(action: {
                guard let pagedObject = pagedObject else { return }
                Task { await fetchPokemon(paginationState: .continuing(pagedObject, .next)) }
            }) {
                Image.right
            }
            .disabled(pagedObject?.hasNext == false)
            
            Spacer()
            
            Button("Last") {
                guard let pagedObject = pagedObject else { return }
                Task { await fetchPokemon(paginationState: .continuing(pagedObject, .last)) }
            }
            .disabled(pagedObject?.hasNext == false)
        }
    }
    
    
    var pagePicker: some View {
        Picker("", selection: $pageIndex) {
            if let pagedObject = pagedObject {
                ForEach(0..<pagedObject.pages, id: \.self) { page in
                    Text("Page \(page + 1)")
                        .tag(page)
                }
            }
        }
        #if os(macOS)
        .pickerStyle(.menu)
        #endif
        .onChange(of: pageIndex) {
            guard let pagedObject = pagedObject else { return }
            Task { await fetchPokemon(paginationState: .continuing(pagedObject, .page(pageIndex))) }
        }
    }
    
    
    
    // MARK: - Data
    
    func fetchPokemon(paginationState: PaginationState<PKMPokemon> = .initial(pageLimit: 20)) async {
        do {
            pagedObject = try await pokemonAPI.pokemonService.fetchPokemonList(paginationState: paginationState)
            pageIndex = pagedObject?.currentPage ?? 0
        }
        catch {
            self.error = error
        }
    }
}



struct PaginatedResultsView_Previews: PreviewProvider {
    static var previews: some View {
        PaginatedResultsView()
            .environmentObject(PokemonAPI())
    }
}
