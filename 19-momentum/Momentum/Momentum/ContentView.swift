//
//  ContentView.swift
//  Momentum
//
// Created by Solygambas 16/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ActivityItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var times = 0
}

class Activities: ObservableObject {
    @Published var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink {
                        ActivityView(item: item, activities: activities)
                    } label: {
                        Text(item.title)
                    }
                    // detail screen + count + incrementation button
                    
                }
            }
            .navigationTitle("Momentum")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddActivity) {
            AddView(activities: activities)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
