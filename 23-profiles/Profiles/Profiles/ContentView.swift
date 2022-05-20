//
//  ContentView.swift
//  Profiles
//
// Created by Solygambas on 20/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct User: Codable, Identifiable {
    var id: UUID
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
    
    var formattedDate: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}

struct Friend: Codable, Identifiable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            // load data
                   List(cachedUsers) { user in
                       NavigationLink {
                           DetailView(user: user)
                       } label: {
                       HStack(alignment: .top) {
                           Image(systemName: user.isActive ? "circle.fill" : "circle")
                               .foregroundColor(user.isActive ? .green : .gray)
                           Text(user.wrappedName)
                               .font(.headline)
                       }}
                   }
                   .task {
                       if cachedUsers.isEmpty {
                           if let retrievedUsers = await loadData() {
                               users = retrievedUsers
                           }
                           
                           await MainActor.run {
                               for user in users {
                                   let newUser = CachedUser(context: moc)
                                   newUser.name = user.name
                                   newUser.id = user.id
                                   newUser.isActive = user.isActive
                                   newUser.age = Int16(user.age)
                                   newUser.about = user.about
                                   newUser.email = user.email
                                   newUser.address = user.address
                                   newUser.company = user.company
                                   newUser.formattedDate = user.formattedDate
                                   newUser.tags = user.tags.joined(separator: ",")
                                   
                                   for friend in user.friends {
                                       let newFriend = CachedFriend(context: moc)
                                       newFriend.id = friend.id
                                       newFriend.name = friend.name
                                       newFriend.user = newUser
                                   }
                                   try? moc.save()
                               }
                           }
                       }
                   }
                   .navigationTitle("Profiles")
        }
    }
    
    func loadData() async -> [User]? {
            // define URL
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                print("Invalid URL")
                return nil
            }
            // fetch data
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                // convert data
                let userDecoder = JSONDecoder()
                userDecoder.dateDecodingStrategy = .iso8601
                if let decodedResponse = try? userDecoder.decode([User].self, from: data) {
                    return decodedResponse
                }
            } catch {
                print("Invalid data")
            }
        return nil
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
