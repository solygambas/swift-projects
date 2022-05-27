//
//
// Favorites.swift
// SnowSeeker
//
// Created by Solygambas on 27/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

class Favorites: ObservableObject {
    private var resorts: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: saveKey) {
                    if let decodedItems = try? JSONDecoder().decode(Set<String>.self, from: savedItems) {
                        resorts = decodedItems
                        return
                    }
                }
        
        resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let encoded = try? JSONEncoder().encode(resorts) {
                        UserDefaults.standard.set(encoded, forKey: saveKey)
                    }
    }
}
