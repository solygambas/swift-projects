//
//
// BookTour.swift
// Dark Map
//
// Created by Solygambas on 29/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct BookTour: View {
    var imageURL = URL(string: "https://cataas.com//cat?type=square")
    
    var body: some View {
        VStack {
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView("Loading guide...")
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 300)
                case .failure:
                    Image(systemName: "shippingbox")
                default:
                    EmptyView()
                }
                
            }
        }
    }
}

struct BookTour_Previews: PreviewProvider {
    static var previews: some View {
        BookTour()
    }
}
