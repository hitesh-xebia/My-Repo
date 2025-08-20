//
//  SplashView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 17/07/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Text("WELCOME")
                .italic()
                .font(.system(size: 25))
                .fontWeight(.medium)
                .foregroundStyle(.green)
                .padding(.top, 50)
            
            Spacer()
            
            Image(systemName: "lasso.badge.sparkles")
                .font(.system(size: 150))
                .foregroundStyle(.green)
                .padding(.bottom, 50)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top)
    }
}

#Preview {
    SplashView()
}
