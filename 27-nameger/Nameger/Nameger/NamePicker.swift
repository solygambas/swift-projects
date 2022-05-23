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
    @Binding var name: String
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                    .padding()
            }
            .navigationTitle("Name your contact")
                        .toolbar {
                            Button("Save") {
                                dismiss()
                            }
                        }
        }
    }
}
