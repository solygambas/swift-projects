//
//  ContentView.swift
//  BetterRest
//
// Created by Solygambas on 04/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import CoreML
import SwiftUI

struct ContentView: View {
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                } header: {
                    Text("When do you want to wake up?").font(.headline)
                }
                Section {
                    Stepper("\(sleepAmount.formatted()) hours",
                            value: $sleepAmount, in: 4...12, step: 0.25)
                } header: {
                    Text("Desired amount of sleep").font(.headline)
                }
                Section {
                    Picker("Number of cups", selection: $coffeeAmount) {
                                            ForEach(1..<21) {
                                                Text("\($0) \($0 == 1 ? "cup" : "cups")").tag($0)
                                            }
                                        }
                } header: {
                    Text("Daily coffee intake")
                        .font(.headline)
                }
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
            .navigationTitle("BetterRest")
                .toolbar {
                    Button("Calculate", action: calculateBedtime)
                }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Sorry"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showingAlert = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
