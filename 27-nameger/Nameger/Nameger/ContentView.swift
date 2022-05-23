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
    let locationFetcher = LocationFetcher()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                    ForEach(photos.items.sorted()) { photo in
                        NavigationLink(
                            destination: DetailView(photo: photo),
                            label: {
                                ZStack(alignment: .bottomLeading) {
                                    photo.image?
                                        .resizable()
                                        .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 50,  maxHeight: 150)
                                        .cornerRadius(10)
                                    Text(photo.name)
                                        .font(.caption)
                                        .fontWeight(.black)
                                        .padding(8)
                                        .foregroundColor(.white)
                                        .shadow(radius: 15)
                                        .offset(x: -5, y: -5)
                                    
                                }
                            })
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Nameger")
            .toolbar {
                Button("Add") {
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
        locationFetcher.start()
        showingNamePicker = true
    }
    
    func saveContact() {
        guard let inputImage = inputImage else { return }
        var newPhoto = Photo(name: contactName)
        let imageSaver = ImageSaver()
        let url = imageSaver.writeToSecureDirectory(uiImage: inputImage, id: newPhoto.id)
        if let location = self.locationFetcher.lastKnownLocation {
                    newPhoto.setLocation(location: location)
                }
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
