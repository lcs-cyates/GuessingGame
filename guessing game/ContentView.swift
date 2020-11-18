//
//  ContentView.swift
//  guessing game
//
//  Created by Yates, Clea on 2020-11-17.
//

import SwiftUI

struct ContentView: View {
   // The guess made by the user
    @State private var theUserGuess = ""
    @State private var target = Int.random(in: 1...100)
    @State private var feedback = ""
    var body: some View{
        NavigationView{
            
        }
        VStack{
            
            Text("Guessing Game")
                .font(.title)
                .padding(.vertical)
            
            Text("I'm thinking of a number between 1 and 100. Guess what it is!")
            
            TextField("Enter your guess here", text: $theUserGuess)
            
            Button ("Submit Guess"){
                //check the guess
            }
            .padding(.all)
            
            Text("You guessed\(theUserGuess)")
            
            Text("\(feedback)")
            guard let givenInteger = Int(theUserGuess)
        }
        .padding(.all)
        .navigationTitle("Guessing Game")
    }
    func checkGuess(){
    }
    func resetGame(){
        target = Int.random(in: 1...100)
        theUserGuess = ""
        feedback = ""
        Button("Reset Game"){
            resetGame()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
