//
//  ContentView.swift
//  Flashzilla
//
// Created by Solygambas on 25/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
//    @State private var currentAmount = Angle.zero
//    @State private var finalAmount = Angle.zero
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
//        Text("Hello, world!")
//            .onTapGesture(count: 2) {
//                print("Double tapped!")
//            }
//            .onLongPressGesture {
//                print("long pressed!")
//            }
//            .onLongPressGesture(minimumDuration: 2) {
//                print("long pressed!")
//            }
//            .onLongPressGesture(minimumDuration: 1) {
//                print("long pressed!")
//            } onPressingChanged: { inProgress in
//                print("In progress: \(inProgress)")
//            }
//            .scaleEffect(finalAmount + currentAmount)
//            .gesture(
//                MagnificationGesture()
//                // option + drag on simulator
//                    .onChanged { amount in
//                        currentAmount = amount - 1
//                    }
//                    .onEnded { amount in
//                        finalAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
//            .rotationEffect(currentAmount + finalAmount)
//            .gesture(
//                RotationGesture()
//                // option + drag on simulator
//                    .onChanged { angle in
//                        currentAmount = angle
//                    }
//                    .onEnded { angle in
//                        finalAmount += currentAmount
//                        currentAmount = .zero
//                    }
//            )
        
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        //.highPriorityGesture(
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded {_ in
//                    print("VStack tapped")
//                }
//        )
        
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        let combined = pressGesture.sequenced(before: dragGesture)
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
