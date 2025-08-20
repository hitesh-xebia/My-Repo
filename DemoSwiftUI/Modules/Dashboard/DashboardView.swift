//
//  DashboardView.swift
//  DemoSwiftUI
//
//  Created by Hitesh Chouhan on 15/07/25.
//

import SwiftUI

enum AppScreen: Identifiable, CaseIterable, Hashable {
    case Home
    case Shop
    case Profile
    
    var id: AppScreen {
        self
    }
}

extension AppScreen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        case .Home:
            Label("Home", systemImage: "house")
        case .Shop:
            Label("Shop", systemImage: "cart")
        case .Profile:
            Label("Profile", systemImage: "person.crop.circle")
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .Home:
            HomeNavigationView()
        case .Shop:
            ProductCollectionView()
                .navigationTitle("Shops")
        case .Profile:
            ProfileView()
                .navigationTitle("Profile")
        }
    }
    
    var title: String {
        switch self {
        case .Home:
            "Home"
        case .Shop:
            "Shops"
        case .Profile:
            "Profile"
        }
    }
}

struct HomeNavigationView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go to details") {
                HomeView()       
            }
            .navigationBarTitle("Home")
        }
    }
}

struct AppTabView: View {
    
    @Binding var selection: AppScreen
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(AppScreen.allCases) { screen in
                screen.destination
                    .tag(screen)
                    .tabItem {
                        screen.label
                    }
            }
        }
    }
}

struct DashboardView: View {
    @State var selection: AppScreen = .Home
    @EnvironmentObject var appState: AppState
    
    var body: some View {
            AppTabView(selection: $selection)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            appState.logOut()
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(.indigo)
                        }
                    }
                }
        }
//    }
}

#Preview {
    DashboardView()
}
