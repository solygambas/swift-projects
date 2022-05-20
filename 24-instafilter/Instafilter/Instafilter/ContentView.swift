//
//  ContentView.swift
//  Instafilter
//
// Created by Solygambas on 20/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var blurAmount = 0.0 {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        // onChange
//        VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) { newValue in
//                 print("New value is \(newValue)")
//                }
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//        }
        
        // confirmation dialog
        Text("Hello, World!")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = .red }
                Button("Green") { backgroundColor = .green }
                Button("Blue") { backgroundColor = .blue }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Select a new color")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
