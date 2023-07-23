//
//  ContentView.swift
//  iExpense
//
//  Created by Nacho Alaves on 23/7/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Text("Personal Expenses")
                        .font(.headline)
                    
                    ForEach(expenses.items, id: \.id) { item in
                        if(item.type == "Personal") {
                            HStack {
                                VStack(alignment: .leading) {
                                    if(item.amount < 10.0) {
                                        Text(item.name)
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                    } else if (item.amount < 100.0) {
                                        Text(item.name)
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                    } else {
                                        Text(item.name)
                                            .font(.headline)
                                            .foregroundColor(.red)
                                    }
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? ""))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section {
                    Text("Business Expenses")
                        .font(.headline)
                    
                    ForEach(expenses.items, id: \.id) { item in
                        if(item.type == "Business") {
                            HStack {
                                VStack(alignment: .leading) {
                                    if(item.amount < 10.0) {
                                        Text(item.name)
                                            .font(.headline)
                                            .foregroundColor(.gray)
                                    } else if (item.amount < 100.0) {
                                        Text(item.name)
                                            .font(.headline)
                                            .foregroundColor(.blue)
                                    } else {
                                        Text(item.name)
                                            .font(.headline)
                                            .foregroundColor(.red)
                                    }
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? ""))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                }

            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
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
