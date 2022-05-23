//
//  ContentView.swift
//  Nameger
//
// Created by Solygambas on 22/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var photos = PhotoCollection()
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @State private var showingNamePicker = false
    @State private var contactName = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                // show all names and photos
                // detail screen with full size picture
                ForEach(photos.items.sorted()) { photo in
                    NavigationLink(destination: Text(photo.name),
                                   label: {
                        photo.image?
                            .resizable()
                            .scaledToFit()
                    })
                }
            }
            .navigationTitle("Nameger")
            .toolbar {
                Button("New Contact") {
                    showingImagePicker = true
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    VStack {
                        ImagePicker(image: $inputImage)
                    }
                }
            }
            .sheet(isPresented: $showingNamePicker, onDismiss: saveContact) {
                NamePicker(name: $contactName)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        showingNamePicker = true
    }
    
    func saveContact() {
        guard let inputImage = inputImage else { return }
        let newPhoto = Photo(name: contactName)
        let imageSaver = ImageSaver()
        let url = imageSaver.writeToSecureDirectory(uiImage: inputImage, id: newPhoto.id)
        if url != nil {
            photos.append(newPhoto)
            contactName = ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
