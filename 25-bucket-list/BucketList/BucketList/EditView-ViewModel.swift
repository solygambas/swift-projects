//
//
// EditView-ViewModel.swift
// BucketList
//
// Created by Solygambas on 22/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import Foundation

extension EditView {
    @MainActor class ViewModel: ObservableObject {
        var location: Location
        @Published var name: String
        @Published var description: String
        @Published var loadingState = LoadingState.loading
        @Published var pages: [Page] = []
        
        enum LoadingState {
            case loading, loaded, failed
        }
        
        init(location: Location) {
          name = location.name
          description = location.description
          self.location = location
        }
        
        func fetchNearbyPlaces() async {
                    let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(location.latitude)%7C\(location.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"

                    guard let url = URL(string: urlString) else {
                        print("Bad URL: \(urlString)")
                        return
                    }

                    do {
                        let (data, _) = try await URLSession.shared.data(from: url)

                        let items = try JSONDecoder().decode(Result.self, from: data)
                        pages = items.query.pages.values.sorted()
                        loadingState = .loaded
                    } catch {
                        loadingState = .failed
                    }
                }
    }
}
