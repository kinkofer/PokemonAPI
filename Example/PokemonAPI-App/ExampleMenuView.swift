//
//  ExampleMenuView.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 11/17/24.
//

import SwiftUI

struct ExampleMenuView: View {
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink("Async/Await Example", destination: AsyncAwaitExampleView())
                NavigationLink("Paginated Results Example", destination: PaginatedResultsView())
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
        } detail: {
            Text("Select an example to see it in action.")
        }
    }
}

#Preview {
    ExampleMenuView()
}
