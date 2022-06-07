//
//  LoadingListExample.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 6/7/22.
//

import SwiftUI
import PokemonAPI


struct LoadingListExample: View {
    @EnvironmentObject var pokemonAPI: PokemonAPI
    @State var error: Error?
    
    /// The array of item categories to display
    @State var itemCategories = [PKMNamedAPIResource<PKMItemCategory>]()
    
    /// The current pagedObject returned from the paginated web service call.
    @State var pagedObject: PKMPagedObject<PKMItemCategory>?
    
    @State var isLoading = false
    
    
    var body: some View {
        VStack {
            if let error = error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else if !itemCategories.isEmpty,
                let pagedObject = pagedObject {
                List {
                    ForEach(itemCategories, id: \.url) { itemCategory in
                        Group {
                            #if os(tvOS) || os(watchOS)
                            Button(itemCategory.name ?? "Unknown Item Category") { }
                            #else
                            Text(itemCategory.name ?? "Unknown Item Category")
                            #endif
                        }
                        .onAppear {
                            // Load more if viewing the last pokemon and more can be loaded
                            guard itemCategory.url == pagedObject.results?.last?.url,
                                  pagedObject.hasNext else { return }
                            Task {
                                await fetchItemCategories(paginationState: .continuing(pagedObject, .next))
                            }
                        }
                    }
                    if isLoading {
                        Text("... Loading")
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Fetch Item Categories")
        .task {
            await fetchItemCategories()
        }
    }
    
    
    
    // MARK: - Data
    
    func fetchItemCategories(paginationState: PaginationState<PKMItemCategory> = .initial(pageLimit: 20)) async {
        guard !isLoading else { return }
        
        isLoading = true
        
        do {
            pagedObject = try await pokemonAPI.itemService.fetchItemCategoryList(paginationState: paginationState)
            if let newResults = pagedObject?.results as? [PKMNamedAPIResource] {
                itemCategories.append(contentsOf: newResults)
            }
        }
        catch {
            self.error = error
        }
        
        isLoading = false
    }
}



struct LazyListExample_Previews: PreviewProvider {
    static var previews: some View {
        LoadingListExample()
            .environmentObject(PokemonAPI())
    }
}
