//
//  ContentView.swift
//  Instafilter
//
// Created by Solygambas on 20/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
//    @State private var blurAmount = 0.0 {
//        didSet {
//            print("New value is \(blurAmount)")
//        }
//    }
//    @State private var showingConfirmation = false
//    @State private var backgroundColor = Color.white
    @State private var image: Image?
    
    var body: some View {
        // onChange
//        VStack {
//            Text("Hello, World!")
//                .blur(radius: blurAmount)
//            Slider(value: $blurAmount, in: 0...20)
//                .onChange(of: blurAmount) { newValue in
//                 print("New value is \(newValue)")
//                }
//            Button("Random Blur") {
//                blurAmount = Double.random(in: 0...20)
//            }
//        }
        
        // confirmation dialog
//        Text("Hello, World!")
//            .frame(width: 300, height: 300)
//            .background(backgroundColor)
//            .onTapGesture {
//                showingConfirmation = true
//            }
//            .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
//                Button("Red") { backgroundColor = .red }
//                Button("Green") { backgroundColor = .green }
//                Button("Blue") { backgroundColor = .blue }
//                Button("Cancel", role: .cancel) { }
//            } message: {
//                Text("Select a new color")
//            }
        
        // core image
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        //image = Image("Example")
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        
        // FILTERS
        // sepia
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        // pixellation
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 100
        // crystal
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 200
        // twirl distortion
//        let currentFilter = CIFilter.twirlDistortion()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 1000
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        // CIImage
        guard let outputImage = currentFilter.outputImage else { return }
        // from CIImage to CGImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert to UIImage
            let uiImage = UIImage(cgImage: cgimg)
            // convert to SwiftUI Image
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
