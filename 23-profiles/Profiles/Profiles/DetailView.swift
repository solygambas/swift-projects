//
//
// DetailView.swift
// Profiles
//
// Created by Solygambas on 20/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct DetailView: View {
    let user: CachedUser
    
    var body: some View {
        List {
            Section {
                Text("Registered: \(user.wrappedFormattedDate)")
                                Text("Age: \(user.age)")
                                Text("Email: \(user.wrappedEmail)")
                                Text("Address: \(user.wrappedAddress)")
                                Text("Works for: \(user.wrappedCompany)")
            } header: {
                Text("Basic Info")
            }
            Section {
                    Text(user.wrappedAbout)
            } header: {
                Text("About")
            }
            Section {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(user.wrappedTags, id: \.self) { tag in
                        Text(tag)
                        }
                    }
                }
            } header: {
                Text("Tags")
            }
            Section {
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                    
                }
            } header: {
                Text("Friends")
            }
            
        }
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
