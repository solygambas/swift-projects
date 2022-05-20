//
//  ProfilesApp.swift
//  Profiles
//
// Created by Solygambas on 20/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

@main
struct ProfilesApp: App {
    @StateObject private var dataController = DataController()
        
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
        }
}
