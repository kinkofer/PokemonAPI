//
//  PaginatedResultsView.swift
//  PaginatedResultsView
//
//  Created by Christopher Jennewein on 10/15/21.
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
        ScrollView {
            Spacer()
            mainContent
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        menu
                    }
                }
                .navigationTitle("Fetch Pokémon List")
                .task {
                    await fetchPokemon()
                }
        }
    }
    
    
    var mainContent: some View {
        VStack {
            if let error = error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else if let pagedObject = pagedObject,
                    let pokemonResults = pagedObject.results as? [PKMNamedAPIResource] {
                Group {
                    ForEach(pokemonResults, id: \.url) { pokemon in
                        Button(pokemon.name ?? "Unknown Pokémon") { }
                    }
                }
            }
        }
    }
    
    
    var menu: some View {
        VStack {
            pagePicker
                .disabled(pagedObject?.pages ?? 0 <= 1)
            HStack {
                Button(action: {
                    guard let pagedObject = pagedObject else { return }
                    Task { await fetchPokemon(paginationState: .continuing(pagedObject, .first)) }
                }) {
                    Image.first
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
                
                Button(action: {
                    guard let pagedObject = pagedObject else { return }
                    Task { await fetchPokemon(paginationState: .continuing(pagedObject, .next)) }
                }) {
                    Image.right
                }
                .disabled(pagedObject?.hasNext == false)
                
                Spacer()
                
                Button(action: {
                    guard let pagedObject = pagedObject else { return }
                    Task { await fetchPokemon(paginationState: .continuing(pagedObject, .last)) }
                }) {
                    Image.last
                }
                .disabled(pagedObject?.hasNext == false)
            }
        }
    }
    
    
    var pagePicker: some View {
        NavigationLink("Page \(pageIndex + 1)") {
            PageSelectView(pages: pagedObject?.pages ?? 0, pageIndex: $pageIndex)
                .onChange(of: pageIndex) { index in
                    guard let pagedObject = pagedObject else { return }
                    Task { await fetchPokemon(paginationState: .continuing(pagedObject, .page(index))) }
                }
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


struct PaginatedResultsWatchView_Previews: PreviewProvider {
    static var previews: some View {
        PaginatedResultsView()
    }
}
