//
//
// TabExample.swift
// HotProspects
//
// Created by Solygambas on 24/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct TabExample: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    selectedTab = "Two"
                }
                .tabItem {
                    Label("One", systemImage: "star")
                }
                .tag("One")
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                        .tag("Two")
                }
        }
    }
}

struct TabExample_Previews: PreviewProvider {
    static var previews: some View {
        TabExample()
    }
}
