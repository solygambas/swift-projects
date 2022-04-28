//
//
// ScoreView.swift
// Score It
//
// Created by Solygambas on 28/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var gameScore: GameScore
    
    var body: some View {
        VStack {
            Text("The score is \(gameScore.score)!")
            Text("The piece count is \(gameScore.pieces)!")
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
    }
}
