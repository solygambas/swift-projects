//
//
// SimpleMap.swift
// BucketList
//
// Created by Solygambas on 21/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct SimpleMap: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 28.64, longitude: 77.21), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    let locations = [
        Location(name: "Lodi Garden", coordinate: CLLocationCoordinate2D(latitude: 28.59, longitude: 77.21)),
        Location(name: "India Gate", coordinate: CLLocationCoordinate2D(latitude: 28.61, longitude: 77.23))
    ]
    
    var body: some View {
        NavigationView {
            //        Map(coordinateRegion: $mapRegion)
                    Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                        // MapMarker(coordinate: location.coordinate)
                        MapAnnotation(coordinate: location.coordinate) {
                        NavigationLink {
                            Text(location.name)
                        } label: {
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 44, height: 44)
//                                .onTapGesture {
//                                    print("Tapped on \(location.name)")
//                                }
                        }
                        }
                    }
                    .navigationTitle("Delhi Explorer")
        }
    }
}

struct SimpleMap_Previews: PreviewProvider {
    static var previews: some View {
        SimpleMap()
    }
}
