//
//
// ArrowShapeView.swift
// Drawing
//
// Created by Solygambas on 16/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
      
struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 20, y: 150))
        path.addLine(to: CGPoint(x: 80, y: 150))
        path.addLine(to: CGPoint(x: 60, y: 120))
        path.move(to: CGPoint(x: 60, y: 180))
        path.addLine(to: CGPoint(x: 80, y: 150))
        return path
    }
}

import SwiftUI

struct ArrowShapeView: View {
    @State private var thickness = 10.0
    
    var body: some View {
        VStack {
            Arrow().stroke(.blue, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
            Slider(value: $thickness, in: 1...30, step: 1)
                .padding([.horizontal, .bottom])
        }

    }
}

struct ArrowShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowShapeView()    }
}
