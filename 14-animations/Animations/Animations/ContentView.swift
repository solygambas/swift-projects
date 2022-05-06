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
            //animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
        // .animation(.default, value: animationAmount)
        
        // custom animations
        
//        .animation(.easeOut, value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        // .animation(.easeInOut(duration: 2), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 2).delay(1), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 1).repeatCount(3, autoreverses: true), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
        
        // pulse effect
        .overlay(
        Circle()
            .stroke(.red)
            .scaleEffect(animationAmount)
            .opacity(2 - animationAmount)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
