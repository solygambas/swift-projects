//
//
// ContentView.swift
// Moonshot
//
// Created by Solygambas on 10/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var showingGrid = true
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Button(action: toggleGrid) {
                    Image(systemName: showingGrid ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
                        .foregroundColor(.white)
                        
                }
                .accessibilityElement()
                .accessibilityLabel(showingGrid ? "Show List" : "Show Grid")
                                        }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
    
    func toggleGrid() {
        showingGrid.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
