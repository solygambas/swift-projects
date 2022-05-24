//
//
// ManuealPublish.swift
// HotProspects
//
// Created by Solygambas on 24/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    // @Published var value = 0
    // manual
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManuealPublish: View {
    @StateObject var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is: \(updater.value)")
    }
}

struct ManuealPublish_Previews: PreviewProvider {
    static var previews: some View {
        ManuealPublish()
    }
}
