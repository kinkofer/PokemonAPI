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
    
    @State var isFirstBtnEnabled = false
    @State var isLastBtnEnabled = false
    @State var isPrevBtnEnabled = false
    @State var isNextBtnEnabled = false
    
    @State var pageTitle = "Page 1"
    @State var isPageBtnEnabled = false
    @State var pageIndex = 0
    
    /// The current pagedObject returned from the paginated web service call.
    @State var pagedObject: PKMPagedObject<PKMPokemon>? {
        didSet {
            if let pagedObject = pagedObject {
                isFirstBtnEnabled = pagedObject.hasPrevious
                isLastBtnEnabled = pagedObject.hasNext
                isPrevBtnEnabled = pagedObject.hasPrevious
                isNextBtnEnabled = pagedObject.hasNext
                
                isPageBtnEnabled = pagedObject.pages > 1
                pageTitle = "Page \(pagedObject.currentPage + 1)"
            }
        }
    }
    
    
    var body: some View {
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
        .toolbar {
            ToolbarItemGroup(placement: .principal) {
                menu
            }
        }
        .task {
            await fetchPokemon()
        }
    }
    
    
    var menu: some View {
        HStack {
            Button("First") {
                if let pagedObject = pagedObject {
                    Task {
                        await fetchPokemon(paginationState: .continuing(pagedObject, .first))
                    }
                }
            }
            .disabled(!isFirstBtnEnabled)
            
            Spacer()
            
            Button("<") {
                if let pagedObject = pagedObject {
                    Task {
                        await fetchPokemon(paginationState: .continuing(pagedObject, .previous))
                    }
                }
            }
            .disabled(!isPrevBtnEnabled)
            
            Spacer()
            
            pagePicker
            .disabled(!isPageBtnEnabled)
            
            Spacer()
            
            Button(">") {
                if let pagedObject = pagedObject {
                    Task {
                        await fetchPokemon(paginationState: .continuing(pagedObject, .next))
                    }
                }
            }
            .disabled(!isNextBtnEnabled)
            
            Spacer()
            
            Button("Last") {
                if let pagedObject = pagedObject {
                    Task {
                        await fetchPokemon(paginationState: .continuing(pagedObject, .last))
                    }
                }
            }
            .disabled(!isLastBtnEnabled)
        }
    }
    
    
    var pagePicker: some View {
        Picker(pageTitle, selection: $pageIndex) {
            if let pagedObject = pagedObject {
                ForEach(0..<pagedObject.pages, id: \.self) { page in
                    Text("Page \(page + 1)")
                        .tag(page)
                }
            }
        }
        .onChange(of: pageIndex) { index in
            guard let pagedObject = pagedObject else { return }
            Task {
                await fetchPokemon(paginationState: .continuing(pagedObject, .page(index)))
            }
        }
    }
    
    
    
    // MARK: - Data
    
    func fetchPokemon(paginationState: PaginationState<PKMPokemon> = .initial(pageLimit: 20)) async {
        do {
            pagedObject = try await pokemonAPI.pokemonService.fetchPokemonList(paginationState: paginationState)
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
