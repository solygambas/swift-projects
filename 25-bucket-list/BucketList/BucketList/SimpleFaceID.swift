//
//
// SimpleFaceID.swift
// BucketList
//
// Created by Solygambas on 21/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        
import LocalAuthentication
import SwiftUI

struct SimpleFaceID: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                } else {
                    //
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct SimpleFaceID_Previews: PreviewProvider {
    static var previews: some View {
        SimpleFaceID()
    }
}
