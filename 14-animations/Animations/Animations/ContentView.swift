//
//  ContentView.swift
//  Animations
//
// Created by Solygambas on 06/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        // implicit animations
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
