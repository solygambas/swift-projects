//
//  ContentView.swift
//  LayoutAndGeometry
//
// Created by Solygambas on 26/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

//struct OuterView: View {
//    var body: some View {
//        VStack {
//            Text("Top")
//            InnerView()
//                .background(.green)
//            Text("Bottom")
//        }
//    }
//}
//
//struct InnerView: View {
//    var body: some View {
//        HStack {
//            Text("Left")
//            GeometryReader { geo in
//                Text("Center")
//                    .background(.blue)
//                    .onTapGesture {
//                        print("Global center on screen: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
//                        print("Custom center relative to some other view: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
//                        print("Local center relative to parent: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
//                                            }
//            }
//                .background(.orange)
//            Text("Right")
//        }
//    }
//}

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
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
//        HStack(alignment: .midAccountAndName) {
//            VStack {
//                Text("@freezer")
//                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
//                Image("freezer")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 64, height: 64)
//            }
//            VStack {
//                Text("Full name:")
//                Text("Freezer Freezer")
//                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
//                    .font(.largeTitle)
//            }
//        }
        
        // absolute position
//        Text("Hello, world!")
//            //.position(x: 100, y: 100)
//            .offset(x: 100, y: 100)
//            .background(.red)
        
        // GeometryReader
//        VStack {
//            GeometryReader { geo in
//                        Text("Hello, World!")
//                            .frame(width: geo.size.width * 0.9)
//                            .background(.red)
//                    }
//            .background(.green)
//            Text("More text")
//                .background(.blue)
//        }
//        OuterView()
//            .background(.red)
//            .coordinateSpace(name: "Custom")
        
        // scrollview effects
        // spinning helix effect
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
        
        // coverflow
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(1..<20) { num in
//                    GeometryReader { geo in
//                        Text("Number \(num)")
//                            .font(.largeTitle)
//                            .padding()
//                            .background(.red)
//                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
//                            .frame(width: 200, height: 200)
//                    }
//                    .frame(width: 200, height: 200)
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extension VerticalAlignment {
//    enum MidAccountAndName: AlignmentID {
//        static func defaultValue(in d: ViewDimensions) -> CGFloat {
//            d[.top]
//        }
//    }
//
//    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
//}
