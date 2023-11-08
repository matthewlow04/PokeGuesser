//
//  ContentView.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-18.
//

import SwiftUI

struct PokedexView: View {
    @Binding var pokemon: [Pokemon]
    @State var searchText = ""
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(searchText == "" ? pokemon : pokemon.filter({$0.name.contains(searchText.lowercased())})) { entry in
                    PokemonCell(pokemon: entry)
                }

            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
           
        }
       

        
       
    
    }
}

