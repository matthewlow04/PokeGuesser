//
//  ContentView.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-18.
//

import SwiftUI

struct PokedexView: View {
    @State var pokemon = [Pokemon]()
    @State var searchText = ""
    var body: some View {
        
        NavigationView{
            List{
                ForEach(searchText == "" ? pokemon : pokemon.filter({ //if search text empty return entire pokemon array
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    PokemonCell(pokemon: entry)
                }
            }
            .onAppear{
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
