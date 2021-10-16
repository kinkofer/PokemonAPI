//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Jennewein on 10/3/21.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Completion Example", destination: CompletionExampleView())
                NavigationLink("Combine Example", destination: CombineExampleView())
                NavigationLink("Async/Await Example", destination: AsyncAwaitExampleView())
                #if os(iOS) || os(macOS)
                    NavigationLink("Paginated Results Example", destination: PaginatedResultsView())
                #elseif os(tvOS)
                    NavigationLink("Paginated Results Example", destination: PaginatedResultsTVView())
                #elseif os(watchOS)
                    NavigationLink("Paginated Results Example", destination: PaginatedResultsWatchView())
                #endif
            }
            #if os(iOS) || os(macOS)
            .listStyle(.sidebar)
            #endif
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
