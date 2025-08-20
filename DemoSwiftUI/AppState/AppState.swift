//
//  AppState.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 17/07/25.
//

import Foundation

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isLoading: Bool = true
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Example: Check if token exists
            self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
            self.isLoading = false
        }
    }
    
    func logIn() {
        isLoggedIn = true
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
    }
    
    func logOut() {
        isLoggedIn = false
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
}
