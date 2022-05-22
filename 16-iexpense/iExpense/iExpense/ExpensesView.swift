//
//
// ExpensesView.swift
// iExpense
//
// Created by Solygambas on 09/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

struct ExpensesView: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .foregroundColor(item.amount <= 10 ?.littleExpenseColor:
                    item.amount <= 100 ? .normalExpenseColor : .hugeExpenseColor)
        }
        .accessibilityElement()
        .accessibilityLabel("\(item.name) \(item.amount)")
        .accessibilityHint(item.type)
    }
}
