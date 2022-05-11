//
//
// DividerView.swift
// Moonshot
//
// Created by Solygambas on 11/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
