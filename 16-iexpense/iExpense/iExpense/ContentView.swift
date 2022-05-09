//
//  ContentView.swift
//  iExpense
//
// Created by Solygambas on 09/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal"}
    }
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business"}
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

extension Color {
    static let littleExpenseColor = Color("expenseSmallColor")
    static let normalExpenseColor =
    Color("expenseStandardColor")
    static let hugeExpenseColor = Color("expenseHighColor")
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Personal")) {
                    ForEach(expenses.personalItems) { item in
                        ExpensesView(item: item)
                    }
                    .onDelete(perform: removeItems)
                }
                Section(header: Text("Business")) {
                    ForEach(expenses.businessItems) { item in
                        ExpensesView(item: item)
                    }
                    .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
//                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
//                    expenses.items.append(expense)
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
