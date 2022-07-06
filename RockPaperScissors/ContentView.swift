//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Beto Toro on 5/07/22.
//

import SwiftUI

enum Choices {
  case Rock, Paper, Scissors, None
}

struct ContentView: View {
  
  let moves: [Choices] = [.Rock, .Paper, .Scissors]
  @State private var appSelection: Choices
  @State private var userSelection: Choices = .None
  @State private var gameSelection: String = ""
  @State private var gameMessage = ""
  @State private var winOrLose = "win"
  @State private var isAlertShow = false
  @State private var score = 0
  
  init() {
    appSelection = moves[Int.random(in: 0...2)]
    
    // toChange the navigation title color
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
  }
  
  func winChoice() {
    if appSelection == userSelection {
      gameMessage = "Tie! try again!"
      gameSelection = "\(appSelection)"
      return
    }
    
    if appSelection == .Rock {
      if userSelection == .Scissors {
        gameMessage = "You Lose"
        score -= 1
      } else {
        gameMessage = "You Win !!🎉"
        score += 1
      }
    } else if appSelection == .Paper {
      if userSelection == .Rock {
        gameMessage = "You Lose"
        score -= 1
      } else {
        gameMessage = "You Win !!🎉"
        score += 1
      }
    } else {
      if userSelection == .Paper {
        gameMessage = "You Lose"
        score -= 1
      } else {
        gameMessage = "You Win !!🎉"
        score += 1
      }
    }
    
    gameSelection = "\(appSelection)"
    
  }
  
  func askQuestion() {
    appSelection = moves[Int.random(in: 0...2)]
    print(appSelection)
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        Color.indigo
          .ignoresSafeArea()
        
        
        VStack(spacing: 50) {
          
          Spacer()
          
          Text("Choose your move")
            .font(.title2.bold())
            .foregroundColor(.white)
          
          HStack(spacing: 25) {
            Button("✊🏽") {
              userSelection = .Rock
              winChoice()
              isAlertShow = true
            }
            .font(.largeTitle)
            
            Button("🤚🏽") {
              userSelection = .Paper
              winChoice()
              isAlertShow = true
            }
            .font(.largeTitle)
            Button("✌🏽") {
              userSelection = .Scissors
              winChoice()
              isAlertShow = true
            }
            .font(.largeTitle)
          }
          .navigationTitle("Rock Paper Scissors")
          
          Spacer()
          
          Text("Your score is: \(score)")
            .foregroundColor(.white)
          
          Spacer()
          
        }
      }
      .alert(gameMessage, isPresented: $isAlertShow) {
        Button("Continue", action: askQuestion)
      } message: {
        Text("The app chosen: \(gameSelection)")
          .foregroundColor(.white)
      }
    
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
