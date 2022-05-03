//
//  ContentView.swift
//  RockPaperScissors
//
// Created by Solygambas on 03/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨 Rock", "📃 Paper", "✂️ Scissors"]
    let winningMoves = ["📃 Paper", "✂️ Scissors", "🪨 Rock"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 0
    @State private var showingResult = false
    
    // app pick
    // player move // toggle()
    // check move +1 or -1
    // 10 rounds
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.886, green: 0.918, blue: 0.988), location: 0.4),
                .init(color: Color(red: 0.671, green: 0.769, blue: 1), location: 0.4)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Score: \(score)")
                    .font(.title.bold())
                    .padding()
                Text("\(moves[appChoice])")
                    .font(.title).padding(5)
                Text("You have to \(shouldWin ? "win" : "lose")")
                    .font(.headline.bold())
                Spacer()
                VStack {
                    ForEach(0..<3) { number in
                        Button {
                            checkChoice(number)
                        } label: {
                            Text("\(winningMoves[number])")
                                .font(.system(size: 40))
                                .foregroundColor(.primary)
                        }
                    }.padding()
                }.padding(10)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
            }
            .alert("Rock, paper, scissors", isPresented: $showingResult) {
                Button("Play again", action: reset)
            } message: {
                Text("Your final score is \(score)/\(round)")
            }
        }
    }
    
    func checkChoice(_ number: Int) {
        if (shouldWin ? number == appChoice : number != appChoice) {
            score += 1
        } else {
            score = score > 0 ? score - 1 : 0
        }
        round += 1
        if round < 10 { launchNewGame() } else {
            showingResult = true
        }
    }
    
    func launchNewGame() {
        appChoice = Int.random(in: 0...2)
        shouldWin.toggle()
    }
    
    func reset() {
        score = 0
        round = 0
        launchNewGame()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
