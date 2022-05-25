//
//
// AllowsHitView.swift
// Flashzilla
//
// Created by Solygambas on 25/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct AllowsHitView: View {
    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
//                .allowsHitTesting(false)
//        }
        VStack {
            Text("hello")
            Spacer().frame(height: 100)
            Text("world")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

struct AllowsHitView_Previews: PreviewProvider {
    static var previews: some View {
        AllowsHitView()
    }
}
