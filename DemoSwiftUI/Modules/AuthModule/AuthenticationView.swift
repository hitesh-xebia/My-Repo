//
//  AuthenticationView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 17/07/25.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                VStack {
                    VStack {
                        Image(systemName: "lasso.badge.sparkles")
                            .font(.system(size: 100))
                            .foregroundStyle(.green)
                    }
                    .frame(maxWidth: .infinity, maxHeight: proxy.size.height * 0.5)
                    .background(.green.opacity(0.2))
                    
                    VStack {
                        
                        Spacer()
                        
                        NavigationLink {
                            LoginView()
                        } label: {
                            Text("Login")
                                .kerning(1.0)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, maxHeight: 55)
                                .background(.black)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                        
                        NavigationLink {
                            //
                        } label: {
                            Text("Register")
                                .kerning(1.0)
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                                .frame(maxWidth: .infinity, maxHeight: 55)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                }
                        }
                        .padding()
                        
                        Button {
                            //
                        } label: {
                            Text("Continue as a Guest")
                                .underline()
                                .foregroundStyle(.green.opacity(0.9))
                        }
                        .padding()
                    }
                    .frame(maxWidth: .infinity, maxHeight: proxy.size.height * 0.5)
                }
            }
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(AppState())
}
