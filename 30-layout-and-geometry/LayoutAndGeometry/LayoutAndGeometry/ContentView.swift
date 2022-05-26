//
//  ContentView.swift
//  LayoutAndGeometry
//
// Created by Solygambas on 26/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Text("Hello, world!")
//            .padding(20)
//            .background(.red)
//        Color.red
//            .ignoresSafeArea()
        
        // alignment
//        Text("Live long and prosper")
//            .frame(width: 300, height: 300, alignment: .topLeading)
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
        //VStack(alignment: .leading) {
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in d[.trailing]}
//            Text("This is a longer line of text")
//            ForEach(0..<10) { position in
//                Text("Number \(position)")
//                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10}
//            }
//        }
//        .background(.red)
//        .frame(width: 400, height: 400)
//        .background(.blue)
        
        // custom alignment guide
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@freezer")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("freezer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
            }
            VStack {
                Text("Full name:")
                Text("Freezer Freezer")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
