//
//  ContentView.swift
//  GuessTheFlag
//
// Created by Solygambas on 01/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var showingResult = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var round = 0
    @State private var selectedFlag = ""
    @State private var degreesAmount = 0.0
    @State private var opacityLevel = 1.0
    @State private var animationAmount = 1.0
    
    var body: some View {
        ZStack {
            //Color.blue.ignoresSafeArea()
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            selectedFlag = countries[number]
                            flagTapped(number)
                            withAnimation() {
                                degreesAmount += 360
                                opacityLevel -= 0.75
                                animationAmount = 0
                            }
                            
                        } label: {
//                            Image(countries[number])
//                                .renderingMode(.original)
//                                .clipShape(Capsule())
//                                .shadow(radius: 5)
                            //FlagImage(country: countries[number])
                                
                           Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius:5)
                                .rotation3DEffect(.degrees( selectedFlag == countries[number] ? degreesAmount : 0), axis:(x:0, y:1, z:0))
                                .opacity(selectedFlag == countries[number] ? 1.0 : opacityLevel)
                                .scaleEffect(selectedFlag == countries[number] ? 1.0 : animationAmount)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }.padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert(scoreTitle, isPresented: $showingResult) {
            Button("Restart", action: reset)
        } message: {
            Text("Your final score is \(score)/\(round)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score = score > 0 ? score - 1 : 0
        }
        round += 1
        if round < 8 { showingScore = true } else { showingResult = true }
    }
    
    func askQuestion() {
        opacityLevel = 1.0
        animationAmount = 1.0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        score = 0
        round = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
