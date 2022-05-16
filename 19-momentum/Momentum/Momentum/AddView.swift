//
//
// AddView.swift
// Momentum
//
// Created by Solygambas on 16/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct AddView: View {
    @State private var title = ""
    @State private var description = ""
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add new activity")
            .toolbar {
                Button("Save") {
                    let item = ActivityItem(title: title, description: description)
                    activities.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
