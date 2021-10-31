//
//  SecondScreen.swift
//  Alan_MyOrder
//
//  Created by Alan Stagg on 2021-09-29.
//

import SwiftUI

struct SecondScreen: View {
    // Data remains tracked from previous screen
    @StateObject var store : Store
    
    var body: some View {
        // Display list of all orders
        // Type, Size, Quantity
        NavigationView {
            List {
                ForEach (self.store.orders) { currentOrder in
                    VStack (alignment: .leading) {
                        Text("Type: \(currentOrder.type.capitalized)")
                            .fontWeight(.bold)
                        Text("Size: \(currentOrder.size.capitalized)")
                            .fontWeight(.light)
                        Text("Quantity: \(currentOrder.quantity)")
                            .fontWeight(.light)                    }
                }
                .onDelete(perform: { indexSet in
                    self.store.orders.remove(atOffsets: indexSet)
                })
            }
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen(store: Store())
    }
}
