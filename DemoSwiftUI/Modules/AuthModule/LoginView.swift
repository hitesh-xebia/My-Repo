//
//  LoginView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 17/07/25.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appState: AppState
    @Environment(\.dismiss) var dismiss
    
    @State var emailID: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome back! Glade to see you, Again!")
                .font(.system(size: 34))
                .fontWeight(.bold)
                .padding()
            
            TextField("Enter your email", text: $emailID)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 55)
                .background(.gray.opacity(0.1))
                .keyboardType(.emailAddress)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.5), lineWidth: 1)
                })
                .padding()
            
            SecurePasswordField(password: $password)
            
            Button("Forgot Password") {
                //
            }
            .foregroundStyle(.black.opacity(0.7))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
            
            Button {
                appState.logIn()
            } label: {
                Text("Login")
                    .kerning(1.0)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .background(.black)
                    .cornerRadius(10)
            }
            .padding()
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray.opacity(0.5))
                .overlay(content: {
                    Text("Or Login with")
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black.opacity(0.8))
                })
                .padding()
            
            GeometryReader { proxy in
                HStack(spacing: 15) {
                    Button {
                        // facebook
                    } label: {
                        Image(systemName: "person.fill.badge.minus")
                            .font(.system(size: 30))
                            .frame(maxWidth: proxy.size.width * 0.3, maxHeight: 60)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                    
                    Button {
                        // facebook
                    } label: {
                        Image(systemName: "person.badge.shield.checkmark.fill")
                            .font(.system(size: 30))
                            .frame(maxWidth: proxy.size.width * 0.3, maxHeight: 60)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                    
                    Button {
                        // facebook
                    } label: {
                        Image(systemName: "person.badge.key.fill")
                            .font(.system(size: 30))
                            .frame(maxWidth: proxy.size.width * 0.3, maxHeight: 60)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            
            Spacer()
            
            CreateAccountPrompView()

        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward.square")
                        .foregroundStyle(.green.opacity(0.9))
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
        .environmentObject(AppState())
}
