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
    @State private var diceNumber = 1
    @State private var sideNumber = 6
    @State private var total = 0
    @State private var results = [Result]()
    let sidesType = [4, 6, 8, 10, 12, 20, 100]
    
    var body: some View {
        // settings
        Form {
            Section {
                Picker("Number of Dice", selection: $diceNumber) {
                    ForEach(1..<5) {
                        Text("\($0)").tag($0)
                                        }
                                    }.pickerStyle(.segmented)
                  
            } header: {
                Text("How many dice?")
            }
            Section {
                Picker("Number of Sides", selection: $sideNumber) {
                    ForEach(sidesType, id: \.self) {
                        Text("\($0)")
                                        }
                                    }.pickerStyle(.segmented)
            } header: {
                Text("How many sides?")
            }
            Section {
                Button("Roll") {
                    for _ in 1...diceNumber {
                        let result = Result(value: Int.random(in: 1...sideNumber))
                        results.insert(result, at: 0)
                        total += result.value
                    }
                }
                if total > 0 {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                    ForEach(results) { result in
                        if result.value <= 6 {
                            Image(systemName: "die.face.\(result.value)")
                                .font(.title)
                        } else if result.value <= 50 {
                                        Image(systemName: "\(result.value).square")
                                            .font(.title)
                                    } else {
                                        Text("\(result.value)")
                                            .font(.title)
                                    }
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
