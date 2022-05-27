//
//
// WelcomeView.swift
// SnowSeeker
//
// Created by Solygambas on 27/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            Text("Please select a resort from the left-hand menu; swipe from the left edge to show it.")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
