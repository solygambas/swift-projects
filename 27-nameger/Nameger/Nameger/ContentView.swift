//
//  ContentView.swift
//  Nameger
//
// Created by Solygambas on 22/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingNamePicker = false
    
    var body: some View {
        NavigationView {
            VStack {
                // show all names and photos
                // detail screen with full size picture
                Text("Future List")
            }
            .navigationTitle("Nameger")
            .toolbar {
                Button("New Contact") {
                    showingImagePicker = true
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                VStack {
                    ImagePicker(image: $inputImage)
                }
            }
            .sheet(isPresented: $showingNamePicker) {
                NamePicker(image: image)
            }
            .onChange(of: inputImage) { _ in loadImage() }       }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        showingNamePicker = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
