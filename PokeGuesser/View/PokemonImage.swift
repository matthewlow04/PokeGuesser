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
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 75, height: 75)
            .onAppear{
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil{
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    print("New url!!! Caching...")
                }else{
                    getSprite(url: loadedData!)
                    print("using cached url")
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.6))
    }
        
    func getSprite(url:String){
        var tempSprite = ""
        
        ChosenPokemonApi().getData(url: url){ sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite
            
        }
    }
}
//
//struct PokemonImage_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonImage()
//    }
//}
