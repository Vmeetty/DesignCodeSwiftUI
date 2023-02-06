//
//  DesignCodeiOS15App.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/3/23.
//

import SwiftUI

@main
struct DesignCodeiOS15App: App {
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
