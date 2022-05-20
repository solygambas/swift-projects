//
//  ContentView.swift
//  Profiles
//
// Created by Solygambas on 20/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable {
    var id: String
    var name: String
}

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            // load data
                   List(users, id: \.id) { user in
                       NavigationLink {
                           VStack(alignment: .leading) {
                               VStack {
                                   Text("\(user.age) years old - \(user.company)")
                                        .font(.headline.bold())
                                        .padding(.bottom, 2)
                                    Text(user.about)
                               }
                                   .padding()
                               List(user.friends, id: \.id) { friend in Text(friend.name)}
                           }
                           .navigationTitle(user.name)
                           .navigationBarTitleDisplayMode(.inline)
                       } label: {
                       HStack(alignment: .top) {
                           Image(systemName: user.isActive ? "circle.fill" : "circle")
                               .foregroundColor(user.isActive ? .green : .gray)
                           Text(user.name)
                               .font(.headline)
                       }}
                   }
                   .task {
                       if users.isEmpty {
                           await loadData()
                       }
                   }
                   .navigationTitle("Profiles")
        }
    }
    
    func loadData() async {
            // define URL
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return
            }
            // fetch data
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                print("its fetching")
                // convert data
                let userDecoder = JSONDecoder()
                userDecoder.dateDecodingStrategy = .iso8601
                if let decodedResponse = try? userDecoder.decode([User].self, from: data) {
                    print(decodedResponse)
                    users = decodedResponse
                }
            } catch {
                print("Invalid data")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
