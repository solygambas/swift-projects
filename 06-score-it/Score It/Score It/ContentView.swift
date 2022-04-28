//
//  ContentView.swift
//  Score It
//
// Created by Solygambas on 28/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameScore = GameScore()
    
    var body: some View {
        NavigationView {
            VStack {
                Button("Add score") {
                    gameScore.score += 1
                }
                .buttonStyle(.bordered)
                .padding()
                Button("Add pieces") {
                    gameScore.pieces += 1
                }
                .buttonStyle(.bordered)
                .padding()
                NavigationLink(destination: ScoreView()) {
                    Text("View Scores...")
                        .padding()
                }
            }
        }.environmentObject(gameScore)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
