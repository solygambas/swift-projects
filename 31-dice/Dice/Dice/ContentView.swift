//
//  ContentView.swift
//  Dice
//
// Created by Solygambas on 26/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct Result: Identifiable {
    var id = UUID()
    let value: Int
}

struct ContentView: View {
    @State private var diceNumber = "1"
    @State private var sideNumber = "6"
    @State private var total = 0
    @State private var results = [Result]()
    
    var body: some View {
        // settings
        Form {
            Section {
                TextField("Number of Dice", text: $diceNumber)
                  
            } header: {
                Text("How many dice?")
            }
            Section {
                TextField("Number of Sides", text: $sideNumber)
            } header: {
                Text("What type?")
            }
            Section {
                Button("Roll") {
                    let dice = Int(diceNumber) ?? 1
                    let sides = Int(sideNumber) ?? 6
                   
                    for _ in 1...dice {
                        let result = Result(value: Int.random(in: 1...sides))
                        results.insert(result, at: 0)
                        total += result.value
                    }
                }
                if total > 0 {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                    ForEach(results) { result in
                        Text(String(result.value))
                    }
                    }
                    }
                    Text(String(total))
                        .font(.title)
                }
            }
        }

        // various values (timer)
        // haptic feedback
        
        // store
        
        // voiceOver support
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
