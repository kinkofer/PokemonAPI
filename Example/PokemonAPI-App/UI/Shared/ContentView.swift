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
                NavigationLink("Paginated Results Example", destination: PaginatedResultsView())
                NavigationLink("Loading List Example", destination: LoadingListExample())
            }
            #if os(iOS) || os(macOS)
            .listStyle(.sidebar)
            #endif
            .navigationTitle("Examples")
            
            Text("Select an example")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
