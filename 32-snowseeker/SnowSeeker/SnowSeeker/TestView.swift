//
//  TestView.swift
//  SnowSeeker
//
// Created by Solygambas on 26/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct TestView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    @State private var layoutVertically = false
    @State private var searchText = ""
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]
    
    var body: some View {
//        NavigationView {
//            NavigationLink {
//                Text("New Secondary")
//            } label: {
//                Text("Hello, world!")
//            }
//                .navigationTitle("Primary")
//            Text("Secondary")
//        }
        
        // sheet and alert with optionals
//        Text("Hello, World!")
//            .onTapGesture {
//                selectedUser = User()
//                isShowingUser = true
//            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
//            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//                Button(user.id) { }
//            }
//            .alert("Welcome", isPresented: $isShowingUser) { }
        
        // groups as layout containers
//        Group {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//        .onTapGesture {
//            layoutVertically.toggle()
//        }
//        if sizeClass == .compact {
//            VStack(content: UserView.init)
//        } else {
//            HStack(content: UserView.init)
//            }
        
        // search
        NavigationView {
            //Text("Searching for \(searchText)")
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
