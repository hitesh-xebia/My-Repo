//
//  SecurePasswordField.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 18/07/25.
//

import SwiftUI

struct SecurePasswordField: View {
    
    @Binding var password: String
    @State private var isSecure = true
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField("Enter your Password", text: $password)
            } else {
                TextField("Enter your Password", text: $password)
            }
            
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 55)
        .background(.gray.opacity(0.1))
        
        .overlay(content: {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        })
        .padding(.horizontal)
    }
}


struct MyInputField_Previews: PreviewProvider {
    struct PreviewWrapper: View {
        @State private var password: String = ""

        var body: some View {
            SecurePasswordField(password: $password)
        }
    }

    static var previews: some View {
        PreviewWrapper()
    }
}
