//
//
// PhotoCollection.swift
// Nameger
//
// Created by Solygambas on 23/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import Foundation

class PhotoCollection: ObservableObject {
    private let file = "photos.json"
    private let imageSaver = ImageSaver()
    private var url: URL
    
    @Published var items = [Photo]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                try? encoded.write(to: url, options: [.atomicWrite, .completeFileProtection])
            } else {
                fatalError("Error encoding your data.")
            }
        }
    }
    
    init() {
        self.url = imageSaver.getDocumentsDirectory().appendingPathComponent(file)
        
        guard let data = try? Data(contentsOf: url) else {
                    print("No \(file) file, so starting with no images.")
                    self.items = []
                    return
                }
                let decoder = JSONDecoder()
                guard let decodedPhotos = try? decoder.decode([Photo].self, from: data) else {
                    fatalError("Failed to decode \(file) from bundle.")
                }
                self.items = decodedPhotos
    }
    
    func append(_ item: Photo) {
        self.items.append(item)
    }
}
