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
//    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    // NSPredicate
//    @FetchRequest(sortDescriptors: [], predicate: //nil
////        NSPredicate(format: "universe == 'Star Wars'")
////                  NSPredicate(format: "universe == %@", "Star Wars")
////                  NSPredicate(format: "name < %@", "F")
////                  NSPredicate(format: "universe in %@", ["Aliens", "Firefly", "Star Trek"])
////                  NSPredicate(format: "name BEGINSWITH %@", "E")
//                  // ignore case
////                  NSPredicate(format: "name BEGINSWITH[c] %@", "e")
////                  NSPredicate(format: "name CONTAINS[c] %@", "e")
//                  NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")
//                  // use AND to build up conditions
//                  // use NSCompoundPredicate to build a predicate out of several ones
//    ) var ships: FetchedResults<Ship>
    
    // dynamic filter
    @State private var lastNameFilter = "A"
    
//    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        // hashable protocol
//        List(students, id: \.self) { student in
//            Text(student.name)
//        }
        
        // constraints
//        VStack {
//            List(wizards, id: \.self) { wizard in
//                Text(wizard.name ?? "Unknown")
//            }
//            Button("Add") {
//                let wizard = Wizard(context: moc)
//                wizard.name = "Harry Potter"
//            }
//            Button("Save") {
//                // check for uncommitted changes
//                // if moc.hasChanges {
//                do {
//                    try moc.save()
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }
        
        // nspredicate
//        VStack {
//            List(ships, id: \.self) { ship in
//                Text(ship.name ?? "Unknown name")
//            }
//            Button("Add Examples") {
//                let ship1 = Ship(context: moc)
//                ship1.name = "Enterprise"
//                ship1.universe = "Star Trek"
//                let ship2 = Ship(context: moc)
//                ship2.name = "Defiant"
//                ship2.universe = "Star Trek"
//                let ship3 = Ship(context: moc)
//                ship3.name = "Millennium Falcon"
//                ship3.universe = "Star Wars"
//                let ship4 = Ship(context: moc)
//                ship4.name = "Executor"
//                ship4.universe = "Star Wars"
//                try? moc.save()
//            }
//        }
        
        // dynamic filter
//        VStack {
//            //FilteredList(filter: lastNameFilter)
        GenericFilteredList(filterKey: "lastName", filterValue: lastNameFilter, filter: .beginswith, descriptors: []) { (singer: Singer) in Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")}
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                try? moc.save()
            }
            Button("Show A") {
                lastNameFilter = "A"
            }
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
        
        // one to many
//        VStack {
//            List {
//                ForEach(countries, id: \.self) { country in
//                    Section(country.wrappedFullName) {
//                        ForEach(country.candyArray, id: \.self) { candy in
//                            Text(candy.wrappedName)
//                        }
//                    }
//                }
//            }
//            Button("Add") {
//                let candy1 = Candy(context: moc)
//                candy1.name = "Mars"
//                candy1.origin = Country(context: moc)
//                candy1.origin?.shortName = "UK"
//                candy1.origin?.fullName = "United Kingdom"
//                let candy2 = Candy(context: moc)
//                candy2.name = "KitKat"
//                candy2.origin = Country(context: moc)
//                candy2.origin?.shortName = "UK"
//                candy2.origin?.fullName = "United Kingdom"
//                let candy3 = Candy(context: moc)
//                candy3.name = "Twix"
//                candy3.origin = Country(context: moc)
//                candy3.origin?.shortName = "UK"
//                candy3.origin?.fullName = "United Kingdom"
//                let candy4 = Candy(context: moc)
//                candy4.name = "Toblerone"
//                candy4.origin = Country(context: moc)
//                candy4.origin?.shortName = "CH"
//                candy4.origin?.fullName = "Switzerland"
//                try? moc.save()
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
