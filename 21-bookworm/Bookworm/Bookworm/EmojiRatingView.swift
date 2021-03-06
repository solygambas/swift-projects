//
//
// EmojiRatingView.swift
// Bookworm
//
// Created by Solygambas on 18/05/2022
// Copyright ÂŠ 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            Text("đ ")
        case 2:
            Text("âšī¸")
        case 3:
            Text("đ")
        case 4:
            Text("đ")
        default:
            Text("đ")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
