//
//
// Photo.swift
// Nameger
//
// Created by Solygambas on 23/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import Foundation
import SwiftUI

struct Photo: Codable, Identifiable, Comparable {
    var id = UUID()
    var name: String
    
    var image: Image? {
            let imageSaver = ImageSaver()
            let url = imageSaver.getDocumentsDirectory().appendingPathComponent("\(id).jpg")
            
            guard let uiImage = try? UIImage(data: Data(contentsOf: url)) else {
                print("Error creating UIImage from url \(url)")
                return nil
            }
            
            return Image(uiImage: uiImage)
        }
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.name.lowercased() < rhs.name.lowercased()
    }
}
