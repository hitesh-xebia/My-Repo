//
//  HomeView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 20/08/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button {
                viewModel.didTapClickMe()
            } label: {
                Text("Click me")
            }
            
            Button {
                viewModel.authenticateWithFaceID()
            } label: {
                Text("Authenticate Face ID")
            }
        }
        
    }
}

#Preview {
    HomeView()
}
