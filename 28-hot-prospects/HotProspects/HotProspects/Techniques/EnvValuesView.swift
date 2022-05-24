//
//  EnvValuesView.swift
//  HotProspects
//
// Created by Solygambas on 24/05/2022
// Copyright © 2022 Solygambas. All rights reserved.)
//
//
//import SwiftUI
//
//@MainActor class User: ObservableObject {
//    @Published var name = "Taylor Swift"
//}
//
//struct EditView: View {
//    @EnvironmentObject var user: User
//    
//    var body: some View {
//        TextField("Name", text: $user.name)
//    }
//}
//
//struct DisplayView: View {
//    @EnvironmentObject var user: User
//    
//    var body: some View {
//        Text(user.name)
//    }
//}
//
//struct EnvValuesView: View {
//    @StateObject private var user = User()
//    
//    var body: some View {
//        VStack {
//            EditView()
//            DisplayView()
//        }
//        .environmentObject(user)
//    }
//}
//
//struct EnvValuesView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnvValuesView()
//    }
//}
