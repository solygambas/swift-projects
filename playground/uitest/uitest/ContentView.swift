//
//  ContentView.swift
//  uitest
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text("Hello!").padding().background(Color.blue)
        Text(/*@START_MENU_TOKEN@*/"Hello"/*@END_MENU_TOKEN@*/)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
