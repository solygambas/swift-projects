//
//  ContentView.swift
//  CoreDataProject
//
// Created by Solygambas on 19/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    // let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        // hashable protocol
//        List(students, id: \.self) { student in
//            Text(student.name)
//        }
        
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            Button("Save") {
                // check for uncommitted changes
                // if moc.hasChanges {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
