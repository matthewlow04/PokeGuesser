//
//  PokemonCell.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-20.
//

import SwiftUI

struct PokemonCell: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        HStack{
            PokemonImage(imageLink: "\(pokemon.url)")
                .padding(.trailing, 20)
            NavigationLink("\(pokemon.name)".capitalized , destination: Text("Detail view for \(pokemon.name)"))
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"))
    }
}
