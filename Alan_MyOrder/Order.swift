//
//  Order.swift
//  Alan_MyOrder
//
//  Created by Alan Stagg on 2021-09-29.
//

import SwiftUI

// Order objects are used to store order information
struct Order : Codable, Identifiable {
    var id : String
    var type : String
    var size : String
    var quantity : String
}
