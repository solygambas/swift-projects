//
//  ContentView.swift
//  CupcakeCorner
//
// Created by Solygambas on 16/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

// Codable conformance
class User: ObservableObject, Codable {
    @Published var name = "Paul Hudson"
    
    enum CodingKeys: CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct TestView: View {
    @State private var results = [Result]()
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        // load data
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                Text(item.collectionName)
//            }
//        }
//        .task {
//            await loadData()
//        }
        
        // load remote image
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3) // 1200 pixels = logo@3x.png
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            // Color.red
//            ProgressView()
//        }
//        .frame(width: 200, height: 200)
        
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
//            if let image = phase.image {
//                image
//                                .resizable()
//                                .scaledToFit()
//            } else if phase.error != nil {
//                Text("There was an error loading the image.")
//            } else {
//                ProgressView()
//            }
//        }
//        .frame(width: 200, height: 200)
        
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            // .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
    
    func loadData() async {
        // define URL
        guard let url = URL(string: "https://itunes.apple.com/search?term=rihanna&entity=song") else {
            print("Invalid URL")
            return
        }
        // fetch data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            // convert data
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
