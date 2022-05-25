//
//
// AccessEnvView.swift
// Flashzilla
//
// Created by Solygambas on 25/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct AccessEnvView: View {
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//    @Environment(\.accessibilityReduceMotion) var reduceMotion
//    @State private var scale = 1.0
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//            Text("Success")
//        }
//        .padding()
//        .background(differentiateWithoutColor ? .black : .green)
//        .foregroundColor(.white)
//        .clipShape(Capsule())
        
//        Text("Hello world")
//            .scaleEffect(scale)
//            .onTapGesture {
////                if (reduceMotion) {
////                    scale *= 1.5
////                } else {
////                    withAnimation {
////                        scale *= 1.5
////                    }
////                }
//                withOptionalAnimation {
//                    scale *= 1.5
//                }
//            }
        
        Text("Hello world")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

struct AccessEnvView_Previews: PreviewProvider {
    static var previews: some View {
        AccessEnvView()
    }
}
