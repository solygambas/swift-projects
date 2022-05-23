//
//
// DetailView.swift
// Nameger
//
// Created by Solygambas on 23/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI
import MapKit

struct LocationPin: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct DetailView: View {
    var photo: Photo
    
    var markers: [LocationPin] {
            if let location = photo.location {
                return [LocationPin(coordinate: location)]
            }
            return []
        }
    
    var body: some View {
        VStack {
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
            if let location = photo.location {
                            VStack(alignment: .leading) {
                                Text("Where we met")
                                    .font(.headline)
                                
                                Map(coordinateRegion: .constant(MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), annotationItems: markers) { item in
                                    MapPin(coordinate: item.coordinate)
                                }
                            }
                            .padding()
        }
        }
        .navigationTitle(photo.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
