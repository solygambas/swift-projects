//
//
// ImagePaintView.swift
// Drawing
//
// Created by Solygambas on 12/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            //.frame(width: 300, height: 300)
            //.background(.red)
            //.border(.red, width: 30)
            //.background(Image("Example"))
            //.border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)
//            .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 300)
    }
}

struct ImagePaintView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintView()
    }
}
