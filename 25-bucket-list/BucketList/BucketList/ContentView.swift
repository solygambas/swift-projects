//
//  ContentView.swift
//  BucketList
//
// Created by Solygambas on 21/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName : String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct ContentView: View {
    // comparable
//    let users = [
//        User(firstName: "Arnold", lastName: "Rimmer"),
//        User(firstName: "Kristine", lastName: "Kochanski"),
//        User(firstName: "David", lastName: "Lister")
//    ].sorted()
    //var loadingState = LoadingState.loading
    
    var body: some View {
//        List(users) { user in
//            Text("\(user.lastName) \(user.firstName)")
//        }
        
        // write data
//        Text("Hello World")
//            .onTapGesture {
//                let str = "Test Message"
//                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
//                do {
//                    try str.write(to: url, atomically: true, encoding: .utf8)
//                    // let input = try String(contentsOf: url)
//                    let input = FileManager.default.loader(url)
//                    print(input)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
        
        // switching view states with enums
//        if loadingState == .loading {
//            LoadingView()
//        } else if loadingState == .success {
//            SuccessView()
//        } else if loadingState == .failed {
//            FailedView()
//        }
        
        // simple map
        SimpleMap()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension FileManager {
    func loader(_ url: URL) -> String {
        if let input = try? String(contentsOf: url) {
            return input
        }
        return ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
