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
    func getWeight(url: String, completion: @escaping (Int?) -> Void) {
        guard let url = URL(string: url) else {
            print("Error loading URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let pokemonSprite = try JSONDecoder().decode(ChosenPokemon.self, from: data)
                completion(pokemonSprite.weight)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }

    func getHeight(url: String, completion: @escaping (Int) -> ()){
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
                completion(pokemonSprite.height)
            }
            
        }.resume()
        
       
    }
    
    func fetchPokemonInfo(url: String, completion: @escaping (ChosenPokemon?) -> Void) {
        guard let url = URL(string: url) else {
            print("Error loading URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let pokemon = try JSONDecoder().decode(ChosenPokemon.self, from: data)
                completion(pokemon)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }

}

