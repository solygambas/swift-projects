//
//
// ContentView.swift
// Bookworm
//
// Created by Solygambas on 17/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
            ForEach(books) { book in
                NavigationLink {
                    DetailView(book: book)
                } label: {
                    HStack {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unkown Title")
                                .foregroundColor(book.rating == 1 ? .red : .primary)
                                .font(.headline)
                            Text(book.author ?? "Unkown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .onDelete(perform: deleteBooks)
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
