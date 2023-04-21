//
//  HomeView.swift
//  PokeGuesser
//
//  Created by Matthew Low on 2023-04-21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Rectangle()
                        .foregroundColor(.red)
                        .ignoresSafeArea()
                    Rectangle()
                        .foregroundColor(.white)
                }
                Image("pokeball")
                    .offset(x: 0, y: -5)
                homeButtons
            }
        }
       
       
    }
}

var homeButtons: some View{
    VStack{
        Text("POKEGuesser")
            .font(.largeTitle)
            .bold()
        Spacer()
        playButton
            .buttonStyle(HomeButtonStyle())
        Spacer()
            .frame(height:50)
        pokedexButton
            .buttonStyle(HomeButtonStyle())
        Spacer()
            .frame(height:50)
    }
}

var playButton: some View {
    NavigationLink(destination: Text("Coming soon")) {
        HStack{
            Text("    PLAY    ")
            Image(systemName: "play")
        }
    }
}
var pokedexButton: some View {
    NavigationLink(destination: PokedexView()) {
        HStack{
            Text("POKEDEX")
            Image(systemName: "play")
        }
        
    }
}

struct HomeButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View{
        configuration.label
            .padding()
            .foregroundColor(.black)
            .background(configuration.isPressed ? Color.red.opacity(0.4) : Color.red)
            .clipShape(Capsule())
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
