//
//  iDineApp.swift
//  iDine
//
//  Created by < Bible  /> on 30/05/2023.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
