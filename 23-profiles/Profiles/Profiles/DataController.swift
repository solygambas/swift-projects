//
//
// DataController.swift
// Profiles
//
// Created by Solygambas on 20/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Profiles")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
