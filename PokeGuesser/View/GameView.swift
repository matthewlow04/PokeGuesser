//
//  GameView.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-21.
//

import SwiftUI


struct GameView: View {
    @Binding var pokemon: [Pokemon]
    @State var currentPokemon = Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
    @State var guess = ""
    @State var score = 0
    @State var highestStreak = 0
    @State var currentStreak = 0
    @State var imageLink = ""
    var body: some View {
        ZStack{
            VStack{
                Rectangle()
                    .foregroundColor(.red)
                    .ignoresSafeArea()
                Rectangle()
                    .foregroundColor(.white)
            }
            VStack{
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.headline)
                Spacer()
                PokemonImage(imageLink: $imageLink, listView: false)
                Spacer()
                HStack{
                    Text("Guess: ")
                    TextField("", text: $guess)
                        .frame(width: 200, height: 50, alignment: .center)
                        .textFieldStyle(.roundedBorder)
                        .foregroundColor(.black)
                }
                
                Spacer()
                newGameButton
                
        }
       
      
        }.onAppear{
            newGame()
        }
    }
    
    var newGameButton: some View{
        Button("GUESS")
        {
            
            print(guess.lowercased())
            print(currentPokemon.name)
            if guess.lowercased() == currentPokemon.name{
                score += 1
                currentStreak += 1
            } else{
                highestStreak = max(currentStreak, highestStreak)
                currentStreak = 0
        
            }
            newGame()
            
            
        }
    }
    
    func newGame(){
        currentPokemon = pokemon.randomElement() ?? Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
        guess = ""
        imageLink = currentPokemon.url
        print(imageLink)
    }
}



/*
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(pokemon: )
    }
}
 */
