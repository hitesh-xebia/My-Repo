//
//  DemoSwiftUIApp.swift
//  DemoSwiftUI
//
//  Created by Hitesh Chouhan on 07/07/25.
//

import SwiftUI

@main
struct DemoSwiftUIApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(appState)
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
