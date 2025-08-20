//
//  AppRootView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 17/07/25.
//

import SwiftUI

struct AppRootView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        if appState.isLoading {
            SplashView()
        } else if appState.isLoggedIn {
            DashboardView()
        } else {
            AuthenticationView()
        }
    }
}

#Preview {
    AppRootView()
}
