//
//  PokemonImage.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-20.
//

import SwiftUI

struct PokemonImage: View {
    @Binding var imageLink: String
    @State private var pokemonSprite = ""
    var listView: Bool

    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: listView ? 75 : 200, height:listView ? 75 : 200)
            .scaleEffect(listView ? 1.0 : 2.0)
            .onChange(of: imageLink) { newImageLink in
                getSprite(url: newImageLink)
            }
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
//                    print("New url!!! Caching...")
                } else {
                    getSprite(url: loadedData!)
//                    print("Using cached url")
                }
            }
            .foregroundColor(Color.gray.opacity(listView ? 0.6 : 0.9))
            .clipShape(RoundedRectangle(cornerRadius: listView ? 10000 : 0))
        

    }
    
    func getSprite(url: String) {
        ChosenPokemonApi().getData(url: url) { sprite in
            self.pokemonSprite = sprite.front_default
        }
    }
}
//
//struct PokemonImage_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonImage()
//    }
//}
