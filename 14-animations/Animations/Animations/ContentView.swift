//
//  ContentView.swift
//  Animations
//
// Created by Solygambas on 06/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var animationAmount = 1.0
//    @State private var animationAmount = 0.0
//    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
//    let letters = Array("Hello SwiftUI")
//    @State private var enabled = false
//    @State private var isShowingRed = false
    
    var body: some View {
        
        // implicit animations
        
//        Button("Tap Me") {
//            //animationAmount += 1
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
        // .animation(.default, value: animationAmount)
        
        // custom animations
        
//        .animation(.easeOut, value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
        // .animation(.easeInOut(duration: 2), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 2).delay(1), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 1).repeatCount(3, autoreverses: true), value: animationAmount)
//        .animation(
//            .easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
        
        // pulse effect
//        .overlay(
//        Circle()
//            .stroke(.red)
//            .scaleEffect(animationAmount)
//            .opacity(2 - animationAmount)
//            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
//        )
//        .onAppear {
//            animationAmount = 2
//        }
        
        // animate bindings
//        print(animationAmount)
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(
//                .easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true)
//            ), in: 1...10)
//            Spacer()
//            Button("Tap me") {
//                animationAmount += 1
//            }
//            .padding(50)
//                    .background(.red)
//                    .foregroundColor(.white)
//                    .clipShape(Circle())
//                    .scaleEffect(animationAmount)
      //}
        
        // explicit animations
        
        // flipping coin
//        Button("Tap me") {
//            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//                .background(.red)
//                .foregroundColor(.white)
//                .clipShape(Circle())
//                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        
        // animation stack
//        Button("Tap me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
////        .animation(.default, value: enabled)
//        // disable animation
//        .animation(nil, value: enabled)
//                .foregroundColor(.white)
//                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//                .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
        
        // animating gestures
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded {_ in
                    //withAimation(.spring()) {
                        dragAmount = .zero
                   // }
                }
            )
            .animation(.spring(), value: dragAmount)
        
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count, id: \.self) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        dragAmount = .zero
//                        enabled.toggle()
//                    }
//            )
//    }
    
        // transitions
//        VStack {
//            Button("Tap Me") {
//                withAnimation {
//                    isShowingRed.toggle()
//                }
//            }
//            if isShowingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
//                    //.transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
        
        // custom transition
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 200, height: 200)
//            if isShowingRed {
//                            Rectangle()
//                                .fill(.red)
//                                .frame(width: 200, height: 200)
//                                .transition(.pivot)
//                        }
//
//        }
//        .onTapGesture {
//            withAnimation {
//                isShowingRed.toggle()
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
