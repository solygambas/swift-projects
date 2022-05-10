//
//  ContentView.swift
//  Moonshot
//
// Created by Solygambas on 10/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

//struct CustomText: View {
//    let text: String
//
//    var body: some View {
//        Text(text)
//    }
//
//    init(_ text: String) {
//        print("Creating a new CustomText")
//        self.text = text
//    }
//}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct TestView: View {
//    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
//    ]
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
//        Image("Example")
//        // fixed size
//            .resizable()
//            // .scaledToFit()
//            .scaledToFill()
//            //.frame(width: 300, height: 300)
//            //.clipped()
        
        // fluid size
//        GeometryReader { geo in
//            Image("Example")
//                .resizable()
//                .scaledToFit()
//                .frame(width: geo.size.width * 0.8)
//            // center
//                .frame(width: geo.size.width, height: geo.size.height)
//        }
        
        // scrollview
//        ScrollView {
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
        
        // horizontal scrollView
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//        }
            
        
        // navigationLink
//        NavigationView {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                Text("Hello, world!")
//                    .padding()
//            }
//                .navigationTitle("SwiftUI")
//        }
        
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                    Text("Row \(row)")
//                        .padding()
//                }
//                    .navigationTitle("SwiftUI")
//            }
//        }
        
        // codable
//        Button("Decode JSON") {
//            let input = """
//            {
//            "name": "Taylor Swift",
//            "address": {
//                "street": "555, Taylor Swift Avenue",
//                "city": "Nashville"
//                }
//            }
//            """
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
        
        // lazyGrid
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<100) {
//                    Text("Item \($0)")
//                }
//            }
//        }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
