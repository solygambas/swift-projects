//
//
// ContentView.swift
// SnowSeeker
//
// Created by Solygambas on 27/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ContentView: View {
    @StateObject var favorites = Favorites()
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchText = ""
    @State private var sort = SortType.none
    @State private var isShowingSettings = false
    
    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .toolbar {
                Button {
                    isShowingSettings = true
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down")
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .confirmationDialog("Sort", isPresented: $isShowingSettings) {
                    Button("None") { sort = .none }
                    Button("Sort by name") { sort = .alphabetical }
                    Button("Sort by country") { sort = .country }
                    Button("Cancel", role: .cancel) { }
                }
            WelcomeView()
        }
        //.phoneOnlyStackNavigationView()
        .environmentObject(favorites)
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    enum SortType {
            case none, alphabetical, country
        }
    
    var sortedResorts: [Resort] {
        switch sort {
        case .none:
            return filteredResorts
        case .alphabetical:
            return filteredResorts.sorted(by: { $0.name < $1.name} )
        case .country:
            return filteredResorts.sorted(by: { $0.country < $1.country})
                    }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// stop iPhones from using the slide over approach
//extension View {
//    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            self.navigationViewStyle(.stack)
//        } else {
//            self
//        }
//    }
//}
