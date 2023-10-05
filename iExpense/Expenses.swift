//
//  Expenses.swift
//  iExpense
//
//  Created by Sandesh-MacBook-Pro on 05/10/23.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encodedExpenses = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedExpenses, forKey: "Items")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Items") {
            if let decodedExpenses = try? JSONDecoder().decode([ExpenseItem].self, from: data) {
                items = decodedExpenses
                return
            }
        }
        
        items = []
    }
}
