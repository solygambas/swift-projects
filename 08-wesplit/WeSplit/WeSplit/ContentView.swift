//
//  ContentView.swift
//  WeSplit
//
// Created by Solygambas on 30/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    //let tipPercentages = [10, 15, 20, 25, 0]
    
    @FocusState private var amountIsFocused: Bool
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var moneyFormatter: FloatingPointFormatStyle<Double>.Currency {
        return .currency(code: Locale.current.currencyCode ?? "USD")
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
//                    Picker("Tip Percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
//                    }.pickerStyle(.segmented)
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text("\($0)%")
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section {
                    Text(grandTotal, format: moneyFormatter)
                } header: {
                    Text("Total")
                }
                Section {
                    Text(totalPerPerson, format: moneyFormatter)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
