//
//  DetailView.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-05-25.
//

import SwiftUI

struct DetailView: View {
    
    var pokemon: Pokemon
    @State private var pokemonDetails: ChosenPokemon?
    @State var imageLink: String
    
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .foregroundColor(.red)
                    .ignoresSafeArea()
                Rectangle()
                    .foregroundColor(.white)
            }
            VStack {
                if let pokemonDetails = pokemonDetails {
                    PokemonImage(imageLink: $imageLink, listView: false)
                    Text("\(pokemon.name.capitalized)")
                    Text("Weight: \(String(format: "%.1f", Double(pokemonDetails.weight).convertToMeasurement())) kilograms")
                    Text("Height: \(String(format: "%.1f", Double(pokemonDetails.height).convertToMeasurement())) metres")
                    // Assuming you have an AsyncImage view to display the Pokemon sprite
                    
                } else {
                    Text("Loading details...")
                }
            }
            .onAppear {
                // Fetch additional details when the view appears
                fetchPokemonDetails()
            }
        }
       
    }
    
    func fetchPokemonDetails() {
        ChosenPokemonApi().fetchPokemonInfo(url: pokemon.url) { result in
            if let pokemonDetails = result {
                self.pokemonDetails = pokemonDetails
            }
        }
    }
}

