//
//  ContentView.swift
//  Executive Timer
//
// Created by Solygambas on 28/04/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

let defaultTime: CGFloat = 60

struct TimerView: View {
    @State private var timerRunning = false
    @State private var countdownTime: CGFloat = defaultTime
    @State private var countdownColor = Color.green

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let strokeStyle = StrokeStyle(lineWidth: 15, lineCap: .round)
    
    
    var body: some View {
        ZStack {
            Circle().stroke(Color.gray.opacity(0.2), style: strokeStyle)
            Circle().trim(from: 0, to: 1 - ((defaultTime - countdownTime) / defaultTime))
                .stroke(countdownColor, style: strokeStyle)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.2), value: countdownTime)
            HStack(spacing: 25) {
                Label("", systemImage: timerRunning ? "pause.rectangle.fill" : "play.rectangle.fill")
                    .foregroundColor(.black).font(.title)
                    .onTapGesture(perform: { timerRunning.toggle() })
                Text("\(Int(countdownTime))")
                Label("", systemImage: "gobackward")
                    .foregroundColor(.red)
                    .font(.title)
                    .onTapGesture(perform: {
                        timerRunning = false
                        countdownTime = defaultTime
                    })
                }
        }.frame(width: 300, height: 300)
       .onReceive(timer, perform: {_ in
            guard timerRunning else { return }
            if countdownTime > 0 {
                countdownTime -= 1
                countdownColor = {
                   switch (countdownTime) {
                       case 30...: return Color.green
                       case 15...: return Color.yellow
                       default: return Color.red
                   }}()
            } else {
                timerRunning = false
                countdownTime = defaultTime
                countdownColor = Color.green
            }
        })
        
    }
}
