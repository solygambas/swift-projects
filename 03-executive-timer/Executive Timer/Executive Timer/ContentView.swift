//
//  ContentView.swift
//  Executive Timer
//
// Created by Solygambas on 28/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TimerView()
                .padding()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .tag("Timer")
            TimerSettingsView()
                .padding()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag("Settings")
        }
    }
}


