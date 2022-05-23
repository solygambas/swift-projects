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
import MapKit

struct Photo: Codable, Identifiable, Comparable {
    var id = UUID()
    var name: String
    var longitude: CLLocationDegrees?
    var latitude: CLLocationDegrees?
    
    var image: Image? {
            let imageSaver = ImageSaver()
            let url = imageSaver.getDocumentsDirectory().appendingPathComponent("\(id).jpg")
            
            guard let uiImage = try? UIImage(data: Data(contentsOf: url)) else {
                print("Error creating UIImage from url \(url)")
                return nil
            }
            
            return Image(uiImage: uiImage)
        }
    
    var location: CLLocationCoordinate2D? {
            guard let latitude = self.latitude, let longitude = self.longitude else {
                return nil
            }
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
    
    mutating func setLocation(location: CLLocationCoordinate2D) {
            self.longitude = location.longitude
            self.latitude = location.latitude
        }
    
    static func <(lhs: Photo, rhs: Photo) -> Bool {
        return lhs.name.lowercased() < rhs.name.lowercased()
    }
}
