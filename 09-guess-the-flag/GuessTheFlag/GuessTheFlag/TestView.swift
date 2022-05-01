//
//
// TestView.swift
// GuessTheFlag
//
// Created by Solygambas on 01/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct TestView: View {
    @State private var showingAlert = false
    
    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//            HStack {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//            HStack {
//                Text("Hello, world!")
//                Text("Hello, world!")
//                Text("Hello, world!")
//            }
//        }
//        ZStack {
//            //Color(red: 1, green: 0.8, blue: 0)
//            Color.red
//                //.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//                .ignoresSafeArea()
//            Text("Your content")
        
// glass effect
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }.ignoresSafeArea()
        
        // gradients
//        LinearGradient(gradient:  Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//        LinearGradient(gradient: Gradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55)]), startPoint: .top,
//                       endPoint: .bottom)
//        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        
        // buttons
//        VStack {
//            Button("Delete selection", role: .destructive, action: executeDelete).buttonStyle(.bordered)
//            Button("Delete selection", action: executeDelete).buttonStyle(.bordered)
//            Button("Delete selection", role: .destructive, action: executeDelete).buttonStyle(.borderedProminent)
//            Button("Delete selection", action: executeDelete).buttonStyle(.borderedProminent)
//            Button("Delete selection", action: executeDelete).buttonStyle(.borderedProminent)
//                .tint(.mint)
//            Button {
//                print("Button was tapped")
//            } label: {
//                    Text("Tap me!")
//                    .padding()
//                    .foregroundColor(.white)
//                    .background(.red)
//            }
//            Button {
//                print("Button was tapped")
//            } label: {
//                    Label("Edit", systemImage: "pencil")
//            }
//        }
        
        // alerts
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            //Button("Ok") { }
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Please read this.")
        }
        
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
