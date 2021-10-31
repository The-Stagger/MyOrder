//
//  Alan_MyOrderApp.swift
//  Alan_MyOrder
//
//  Created by Alan Stagg on 2021-09-29.
//

import SwiftUI

@main
struct Alan_MyOrderApp: App {
    var body: some Scene {
        WindowGroup {
            FirstScreen(store: Store())
        }
    }
}
