//
//  ContentView.swift
//  Dice
//
// Created by Solygambas on 26/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct Result: Identifiable, Codable {
    var id = UUID()
    let value: Int
}

struct ContentView: View {
    @State private var diceNumber = 1
    @State private var sideNumber = 6
    @State private var total = 0
    @State private var results = [Result]()
    @State var isTimerRunning = false
    @State var drawCount = 8
    let sidesType = [4, 6, 8, 10, 12, 20, 100]
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedResults")
    
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
                    isTimerRunning = true
                }
                .disabled(isTimerRunning)
                if total > 0 {
                    HStack {
                    Spacer()
                    if total <= 6 {
                        Image(systemName: "die.face.\(total)")
                            .font(.system(size: 60))
                    } else if total <= 50 {
                        Image(systemName: "\(total).square")
                            .font(.system(size: 60))
                    } else {
                        Text("\(total)")
                            .font(.system(size: 60))
                                }
                    Spacer()
                    }
                    .accessibilityElement()
                }
            }
            if !results.isEmpty {
                Section {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: [GridItem(.adaptive(minimum: 50))], spacing: 10) {
                    ForEach(results) { result in
                        Text(String(result.value))
                            .font(.title)
                    }
                    }
                    }
                    .accessibilityElement()
                    .accessibilityLabel("The result is \(results[0].value)")
                } header: {
                    Text("Previous draws")
                }
            }
        }
        .onReceive(timer) { _ in
            if isTimerRunning {
                if drawCount > 0 {
                    draw()
                } else {
                    update()
                    save()
                }
                }
                
            }
        .onAppear(perform: load)
    }
    
    func draw() {
        total = 0
        for _ in 1...diceNumber {
            total +=  Int.random(in: 1...sideNumber)
        }
        drawCount -= 1
    }
    
    func update() {
        isTimerRunning = false
        let result = Result(value: total)
        results.insert(result, at: 0)
        // haptic feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        drawCount = 8
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(results) {
                    try? encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
                }
    }
    
    func load() {
        if let data = try? Data(contentsOf: savePath) {
                    if let decoded = try? JSONDecoder().decode([Result].self, from: data) {
                        results = decoded
                        return
                    }
                }
        return
    }
}

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
