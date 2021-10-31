//
//  FirstScreen.swift
//  Alan_MyOrder
//
//  Created by Alan Stagg on 2021-09-29.
//

import SwiftUI
import Combine

// Enum describing coffee types
enum CoffeeType: String {
    case original
    case dark
    case vanilla
    case expresso
}

// Enum describing coffee sizes
enum CoffeeSize: String {
    case small
    case medium
    case large
}

struct FirstScreen: View {
    // Track data using states
    @StateObject var store : Store = Store()
    @State private var coffeeType = CoffeeType.original
    @State private var coffeeSize = CoffeeSize.small
    @State private var quantity: String = ""
    
    var body: some View {
        NavigationView {
            // Using form for convenient format
            Form {
                // Picker for coffee type
                // Dark Roast, Original, Vanilla
                Picker("Coffee Type", selection: $coffeeType) {
                    Text("Original").tag(CoffeeType.original)
                    Text("Dark").tag(CoffeeType.dark)
                    Text("Vanilla").tag(CoffeeType.vanilla)
                    Text("Expresso").tag(CoffeeType.expresso)
                }
                
                // Picker for size
                // Small, Medium, Large
                Picker("Coffee Size", selection: $coffeeSize) {
                    Text("Small").tag(CoffeeSize.small)
                    Text("Medium").tag(CoffeeSize.medium)
                    Text("Large").tag(CoffeeSize.large)
                }
                
                // Number input for quantity
                // Use numberpad
                // Additional code is to sanitize inputs in case of exceptions
                TextField("Quantity", text: $quantity)
                            .keyboardType(.numberPad)
                            .onReceive(Just(quantity)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.quantity = filtered
                                }
                            }
                
                // Button to confirm selection
                // Adds new object to array
                Button(action: addOrder) {
                    Text("Add Order")
                }
            }
                
            // Bar button on right side of nav bar
            // Opens SecondScreen
            .navigationBarTitle("Alan_MyOrder")
            .navigationBarItems(trailing: NavigationLink(destination: SecondScreen(store: store)) {
                Text("View Orders")
            })
        }
    }
    
    // turn options into an order and add to order list
    func addOrder() {
        let newOrder = Order(id: UUID().uuidString, type: coffeeType.rawValue, size: coffeeSize.rawValue, quantity: quantity)
        store.orders.append(newOrder)
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen(store: Store())
    }
}
