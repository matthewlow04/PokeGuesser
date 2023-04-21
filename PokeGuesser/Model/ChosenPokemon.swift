//
//  ChosenPokemon.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-18.
//

import Foundation

struct ChosenPokemon: Codable{
    var weight: Int
    var sprites: PokemonSprites
    var height:Int
}

struct PokemonSprites: Codable{
    var front_default: String
}

class ChosenPokemonApi {
    func getData(url: String, completion: @escaping (PokemonSprites) -> ()){
        guard let url = URL(string: url) else {
            print("error loading url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { //assign data to the data we found
                return
            }
            
            let pokemonSprite = try! JSONDecoder().decode(ChosenPokemon.self, from: data)
            
            DispatchQueue.main.async{
                completion(pokemonSprite.sprites)
            }
            
        }.resume()
        
       
    }
}

