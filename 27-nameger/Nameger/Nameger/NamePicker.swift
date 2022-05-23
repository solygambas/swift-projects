//
//
// NamePicker.swift
// Nameger
//
// Created by Solygambas on 23/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct NamePicker: View {
    @Environment(\.dismiss) var dismiss
    var image: Image?
    @State var name = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // save name & photo
                TextField("Name", text: $name)
                    .padding()
                image?
                    .resizable()
                    .scaledToFit()
            }
            .navigationTitle("Name your contact")
                        .toolbar {
                            Button("Save") {
                                //
                                dismiss()
                            }
                        }
        }
    }
}
