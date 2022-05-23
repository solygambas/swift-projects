//
//
// DetailView.swift
// Nameger
//
// Created by Solygambas on 23/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct DetailView: View {
    var photo: Photo
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            photo.image?
                .resizable()
                .scaledToFit()
            Text(photo.name)
                .font(.title)
                .fontWeight(.black)
                .padding(16)
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
        }
        .navigationTitle(photo.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
