//
//
// Prospect.swift
// HotProspects
//
// Created by Solygambas on 24/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

class Prospect: Identifiable, Codable, Comparable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var date = Date.now
    fileprivate(set) var isContacted = false
    
    static func <(lhs: Prospect, rhs: Prospect) -> Bool {
            lhs.name < rhs.name
        }
    
    static func ==(lhs: Prospect, rhs: Prospect) -> Bool {
            lhs.id == rhs.id
        }
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
        //if let data = UserDefaults.standard.data(forKey: saveKey) {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }
        people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            // UserDefaults.standard.set(encoded, forKey: saveKey)
            try? encoded.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
