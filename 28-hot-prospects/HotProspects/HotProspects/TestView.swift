//
//
// TestView.swift
// HotProspects
//
// Created by Solygambas on 24/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI
import SamplePackage

struct TestView: View {
    // @State private var backgroundColor = Color.red
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted() // random is provided by SamplePackage
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        // image interpolation
//        Image("example")
//            .interpolation(.none)
//            .resizable()
//            .scaledToFit()
//            .frame(maxHeight: .infinity)
//            .background(.black)
//            .ignoresSafeArea()
        
        // context menu
//        VStack {
//            Text("Hello, World!")
//                .padding()
//                .background(backgroundColor)
//            Text("Change Color")
//                .padding()
//                .contextMenu {
//                    Button(role: .destructive) {
//                        backgroundColor = .red
//                    } label: {
//                        Label("Red", systemImage: "checkmark.circle.fill")
//                    }
//                    Button("Green") {
//                        backgroundColor = .green
//                    }
//                    Button("Blue") {
//                        backgroundColor = .blue
//                    }
//                }
//        }
        
        // swipe actions
//        List {
//            Text("Taylor Swift")
//                .swipeActions {
//                    Button(role: .destructive) {
//                        print("hi")
//                    } label: {
//                        Label("Delete", systemImage: "minus.circle")
//                    }
//                }
//                .swipeActions(edge: .leading) {
//                    Button {
//                        print("hi")
//                    } label: {
//                        Label("Pin", systemImage: "pin")
//                    }
//                    .tint(.orange)
//                }
//        }
        
        // user notifications
//        VStack {
//            Button("Request Permission") {
//                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
//                    if success {
//                        print("All set!")
//                    } else if let error = error {
//                        print(error.localizedDescription)
//                    }
//                }
//            }
//            Button("Schedule Notification") {
//                let content = UNMutableNotificationContent()
//                content.title = "Feed the cat"
//                content.subtitle = "It looks hungry"
//                content.sound = UNNotificationSound.default
//                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//                UNUserNotificationCenter.current().add(request)
//            }
//        }
        
        // external dependencies
        Text(results)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
