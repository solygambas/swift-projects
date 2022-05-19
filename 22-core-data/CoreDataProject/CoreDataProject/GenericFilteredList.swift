//
//
// GenericFilteredList.swift
// CoreDataProject
//
// Created by Solygambas on 19/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import CoreData
import SwiftUI

enum Filter {
    case equal
    case beginswith
    case contains
}

struct GenericFilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    
    init(filterKey: String, filterValue: String, filter: Filter, descriptors: [SortDescriptor<T>], @ViewBuilder content: @escaping (T) -> Content) {
        var filteredBy: String
        switch filter {
        case .equal:
            filteredBy = "=="
        case .beginswith:
            filteredBy = "BEGINSWITH[c]"
        case .contains:
            filteredBy = "CONTAINS[c]"
        }
        
        _fetchRequest = FetchRequest<T>(sortDescriptors: descriptors, predicate: NSPredicate(format: "%K \(filteredBy) %@", filterKey, filterValue))
        self.content = content
    }
}
