//
//  Store.swift
//  Alan_MyOrder
//
//  Created by Alan Stagg on 2021-09-29.
//

import Foundation

// Store class contains the order list
class Store : ObservableObject {
    
    @Published var orders: [Order]
    
    init (orders: [Order] = []) {
        self.orders = orders
    }
}
