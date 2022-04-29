//
//
// ImageView.swift
// Dark Map
//
// Created by Solygambas on 29/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("delhi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Capsule())
            
            Spacer()
            Image("delhi1")
                .resizable()
                //.frame(width: 300, height: 300)
                .border(Color.indigo, width: 3.0)
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
