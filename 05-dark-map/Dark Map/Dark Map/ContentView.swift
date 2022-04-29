//
//  ContentView.swift
//  Dark Map
//
// Created by Solygambas on 28/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center:
            CLLocationCoordinate2D(latitude: 28.615858, longitude: 77.199429),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading) {
                    Text("New Delhi")
                        .font(.system(size: 40))
                                        .fontWeight(.heavy)
                                        .foregroundColor(.primary)
                    NavigationLink (destination: ImageView()) {
                        HStack (alignment: .top, spacing: 20) {
                                            Image(systemName: "globe.asia.australia.fill").resizable()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(Color(UIColor.systemIndigo))
                                            VStack (alignment: .leading, spacing: 4) {
                                                Text("The Best New Delhi Tours")
                                                    .font(.headline)
                                                    .bold()
                                                    .accentColor(.primary)
                                                Text("Explore the sights of Old and New Delhi.")
                                                    .font(.subheadline)
                                                    .accentColor(.primary)
                                            }
                                        }
                    }
                }
                Map(coordinateRegion: $region)
                    .edgesIgnoringSafeArea(.all)
                Button(action: {}) {
                                Text("Book a tour").foregroundColor(.white).bold()
                }.frame(width: 350, height: 60)
                                .background(Color(UIColor.systemIndigo))
                                .cornerRadius(12)
                                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
