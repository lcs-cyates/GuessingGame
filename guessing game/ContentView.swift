//
//  ContentView.swift
//  guessing game
//
//  Created by Yates, Clea on 2020-11-17.
//

import SwiftUI

struct ContentView: View {
    
    //The number that the user should guess
    @State private var target = Int.random(in: 1...100)
    
    //Feedback to the user
    @State private var feedback = ""
    
    //Current guess made by the user
    @State private var theUserGuess = ""
    
    //prior guess made by the user
    @State private var priorGuess = ""
    
    //keep track of if the game is over
    @State private var gameOver = false
    
    var body: some View{
        
        NavigationView {
            
        
        VStack{
            
            Text("Guessing Game")
                .font(.title)
                .padding(.vertical)
            
            Text("I'm thinking of a number between 1 and 100. Guess what it is!")
            
            TextField("Enter your guess here", text: $theUserGuess)
                .disabled(gameOver)
            
            Button ("Check Guess"){
                //check the guess
                checkGuess()
            }
            .padding(.all)
            .disabled(gameOver)
            
            if priorGuess.conut > 0 {
                Text("Your last guess was \(priorGuess).")
            
                Text("\(feedback)")
                
            }
            
            if gameOver {
                Button("New game"){
                    resetGame()
                }
                Spacer()
            }
            .navigationTitle("Guessing Game")
    }
     
  //check what the user guessed against the target
    func checkGuess(){
        // see if the given intager in the expected range
        guard let givenInteger = Int(theUserGuess) else {
            feedback = "Please provide an integer between 1 and 100."
            return
            
        }
        guard givenInteger > 0, givenInteger < 101 else {
            feedback = "Please provide an integer between 1 and 100."
            return
        }
            
            // is the guess correct?
            let range = givenInteger - target
            switch range {
            case 1...:
                feedback = "Guess lower next time."
            case 0:
                feedback = "Thats correct! Well done."
                gameOver = true
            default:
                feedback = "Guess higher next time."
            }
            
            //Reset the user's guess
            priorGuess = theUserGuess
            theUserGuess = ""
        }
        
            //Reset the game
    
        func resetGame(){
            target = Int.random(in: 1...100)
            theUserGuess = ""
            priorGuess = ""
            gameOver = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    }

