//
//  ContentView.swift
//  ViewsAndModifiers
//
// Created by Solygambas on 02/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    //@State private var useRedText = false
//    let motto1 = Text("Draco dormiens")
//    let motto2 = Text("nunquam titillandus")
    
    // computed properties
//    var spells: some View {
//        VStack {
//            Text("Lumos")
//            Text("Obliviate")
//        }
//    }
//    var spells: some View {
//        Group {
//            Text("Lumos")
//            Text("Obliviate")
//        }
//    }
    @ViewBuilder var spells: some View {
            Text("Lumos")
            Text("Obliviate")
    }
    
    var body: some View {
//        Text("Hello, world!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.red)
        
        // modifier order
//        Button("Hello, world!") {
//            print(type(of: self.body))
//            // ModifiedContent<ModifiedContent<Button<Text>, _FrameLayout>, _BackgroundStyleModifier<Color>>
//        }
//        .frame(width: 200, height: 200)
//        .background(.red)
//        Text("Hello, world")
//            .padding()
//            .background(.red)
//            .padding()
//            .background(.blue)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.yellow)
        
        // conditional modifiers
//        Button("Hello World") {
//            useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)
        
        // environment modifiers
//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)
        
        // views as properties
//        VStack {
//            motto1
//            motto2
//        }
        
        // view composition
//        VStack(spacing: 10) {
//            CapsuleText(text: "First")
//            CapsuleText(text: "Second")
//        }
        
        // custom modifier
//        Text("Hello World")
//            //.modifier(Title())
//            .titleStyle()
//        Color.blue
//            .frame(width: 300, height: 200)
//            .watermarked(with: "Hacking with Swift")
        
        // custom container
        GridStack(rows: 4, columns: 4) { row, col in
            // implicit HStack with @ViewBuilder
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
