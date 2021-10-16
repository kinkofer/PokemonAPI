//
//  CombineExampleView.swift
//  PokemonAPI-App
//
//  Created by Christopher Jennewein on 10/3/21.
//

import Combine
import SwiftUI
import PokemonAPI


struct CombineExampleView: View {
    @EnvironmentObject var pokemonAPI: PokemonAPI
    @State var cancellables = Set<AnyCancellable>()
    
    @State var berry: PKMBerry?
    @State var berryFirmness: PKMBerryFirmness?
    @State var error: Error?
    
    
    var body: some View {
        Group {
            if let error = error {
                Text("An error occurred: \(error.localizedDescription)")
            }
            else if let berry = berry, let name = berry.name {
                Text("Found berry \(name)")
                
                if let berryFirmness = berryFirmness, let firmness = berryFirmness.name {
                    Text("Firmness: \(firmness)")
                }
                else {
                    Text("... fetching firmness")
                }
            }
            else {
                Text("Fetching berry...")
            }
        }
        .onAppear {
            fetchBerryFirmness()
        }
    }
    
    
    func fetchBerryFirmness() {
        pokemonAPI.berryService.fetchBerry(5)
            .tryMap { berry -> PKMNamedAPIResource<PKMBerryFirmness> in
                self.berry = berry
                guard let berryFirmnessResource = berry.firmness else {
                    throw HTTPError.unexpectedResponse
                }
                return berryFirmnessResource
            }
            .flatMap { berryFirmnessResource in
                return self.pokemonAPI.resourceService.fetch(berryFirmnessResource)
            }
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.error = error
                }
            }, receiveValue: { berryFirmness in
                self.berryFirmness = berryFirmness
            })
            .store(in: &cancellables)
    }
}



struct PromiseExampleView_Previews: PreviewProvider {
    static var previews: some View {
        CombineExampleView()
            .environmentObject(PokemonAPI())
    }
}
