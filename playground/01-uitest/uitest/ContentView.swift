//
//  ContentView.swift
//  uitest
//

import SwiftUI

// ContentView conforms to the View protocol:
    // needs a body that returns some View
struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
            HStack() {
                Spacer()
                Text("Hello")
                Spacer()
                Text("World")
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11")
                .preferredColorScheme(.dark)
        }
    }
}
