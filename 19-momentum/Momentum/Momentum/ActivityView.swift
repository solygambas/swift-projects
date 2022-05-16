//
//
// ActivityView.swift
// Momentum
//
// Created by Solygambas on 16/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ActivityView: View {
    let item: ActivityItem
    let activities: Activities
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.headline)
            Text(item.description)
            Button("Count \(item.times)") {
                if let index = activities.items.firstIndex(of: item) {
                    var updatedItem = item
                    updatedItem.times += 1
                    activities.items[index] = updatedItem
                }
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    
    static var previews: some View {
        ActivityView(item: ActivityItem(title: "Example", description: "Example"), activities: Activities())
    }
}
