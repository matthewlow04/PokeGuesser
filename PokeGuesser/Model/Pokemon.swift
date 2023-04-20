//
//  Pokemon.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-18.
//

import Foundation

// https://pokeapi.co/api/v2/pokemon?limit=151

struct Response: Codable {
    var results: [Pokemon]
}

struct Pokemon: Codable, Identifiable{
    let id = UUID()
    var name: String
    var url: String
}

class PokeApi {
    func getData(completion: @escaping ([Pokemon]) -> ()){
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=1010") else {
            print("error loading url")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { //assign data to the data we found
                return
            }
            
            let pokemonList = try! JSONDecoder().decode(Response.self, from: data)
            
            DispatchQueue.main.async{
                completion(pokemonList.results)
            }
            
        }.resume()
        
       
    }
}
