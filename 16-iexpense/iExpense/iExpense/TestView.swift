//
//
// TestView.swift
// iExpense
//
// Created by Solygambas on 09/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI


//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}

//struct SecondView: View {
//    let name: String
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        Text("Hello, \(name)!")
//        Button("Dismiss") {
//            dismiss()
//        }
//    }
//}

struct User: Codable {
    let firstName: String
    let lastName: String
}

struct TestView: View {
   // @StateObject private var user = User()
   // @State private var showingSheet = false
   // @State private var numbers = [Int]()
   // @State private var currentNumber = 1
   // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
   // @AppStorage("tapCount") private var tapCount = 0
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        // state
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName).")
//            TextField("First name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
        
        // sheet
//        Button("Show Sheet") {
//            showingSheet.toggle()
//        }.sheet(isPresented: $showingSheet) {
//            SecondView(name: "Bilbo")
//        }
        
        // delete
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) {
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
        
        // save data
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
//            // UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//        }
        
        // codable
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
    
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
